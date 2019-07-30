import { map } from 'rxjs/operators';

const validateId = (x, form) => {
  // tslint:disable-next-line:triple-equals
  if (typeof x.value == 'undefined' || x.value < 1) {
    return { status: false, msg: 'Please ' + x.name };
  }

  // tslint:disable-next-line:triple-equals
  if (isNaN(x.value) == true) {
    return { status: false, msg: 'Please ' + x.name + ', is not integer' };
  }

  return true;
};

const validateOption = (x, form) => {
  // tslint:disable-next-line:triple-equals
  if (typeof x.value == 'undefined' || x.option.find((e) => e.key == x.value) === false) {
    return { status: false, msg: 'Please Select' + x.name };
  }
  return true;
};

const validateName = (x, form) => {
  // tslint:disable-next-line:triple-equals
  if (typeof x.value == 'undefined' || x.value.length < 3) {
    return { status: false, msg: 'Please fill proper name.' };
  }
  return true;
};

export const DummyOrderSchema: any = {
  name: 'Dummy Order',
  object: 'dummyorder',
  mulitname: 'Dummy Order',
  formAdd: {
    type: {
      name: 'Deal With',
      type: 'radio',
      option: [{ key: 'company', value: 'Company' },
      { key: 'person', value: 'Person' },
      ],
      defult: 'company',
      value: 'company',
      order: 1,

      validate: validateOption

    },
    person_id: {
      name: 'Name Company',
      type: 'autocomplete',
      typing: '',
      searchList: [],
      callback: (x, form) => {
        form.value = x.id;
        form.searchList = [];
        form.typing = x.name;
        form.valuefull = x;
      },
      from: {
        type: 'service',
        value: 'personService.persons'
      },
      default: 0,
      value: 0,
      valuefull: {},
      if: (x) => {
        if (x.type.value === 'company') {
          return true;
        }
        return false;
      },
      order: 2,
      validate: (x, form) => {
        if (form.type.value === 'company') {
          return validateId(x, form);
        }
        return true;
      }
    },
    name: {
      name: 'Name of Person',
      type: 'text',
      default: '',
      value: '',
      if: (x) => {
        if (x.type.value === 'person') {
          return true;
        }
        return false;
      },
      order: 3,

      validate: (x, form) => {
        if (form.type.value === 'person') {
          return validateName(x, form);
        }
        return true;
      }
    },
    delivery_date: {
      name: 'Delivery Date',
      type: 'text',
      order: 4
    },
    description: {
      name: 'Description',
      type: 'textarea',
      default: '',
      value: '',
      order: 5
    },
    items: {
      name: 'List of Products',
      buttonName: 'Add Product',
      type: 'multipleChildren',
      from: {
        type: 'form'
      },
      form: {
        product_id: {
          name: 'Products',
          type: 'autocomplete',
          typing: '',
          searchList: [],
          matches: [{key: 'name', typeof: 'string'}, {key: 'sku', typeof: 'string'}],
          callback: (x, form) => {
            form.value = x.id;
            form.valuefull = x;
            form.searchList = [];
            form.typing = x.name;
          },
          from: {
            type: 'service',
            value: 'productService.products'
          },
          default: 0,
          value: 0,
          valuefull: {},
          validate: validateId
        },
        product_sku: {
          name: 'Code',
          type: 'dependent',
          value: '',
          default: '',
          from: {
            type: 'form',
            value: 'product_id.valuefull.sku'
          },
          validate: (x, formData) => {
            x.value = formData.product_id.valuefull.sku;
            // tslint:disable-next-line:triple-equals
            if (typeof x.value == 'undefined' || x.value.length == 0) {
              return false;
            }
            return true;
          }
        },
        quantity: {
          name: 'Qunatity',
          type: 'number',
          default: 1,
          value: 1,
          min: 1,
          validate: (x, formData) => {
            // tslint:disable-next-line:triple-equals
            if (typeof x.value == 'undefined' || x.value < x.min) {
              return { status: false, msg: 'Minimum value must be ' + x.min };
            }

            if (Number.isInteger(x.value) === false) {
              return { status: false, msg: 'Please ' + x.name + ', is not integer' };
            }
            return true;
          }
        },

        submit: {
          name: 'Add',
          action: (x, parent) => {
            for (const i of parent.items.value) {
              // tslint:disable-next-line:triple-equals
              if (i.product_id == x.product_id) {
                i.quantity += x.quantity;
                return;
              }
            }
            parent.items.value.push(x);
          }
        }
      },
      default: [],
      value: [],
      order: 7,

      validate: (x, form) => {
        // tslint:disable-next-line:triple-equals
        if (x.value == 'undefined' || x.value.length < 1) {
          return { status: false, msg: 'Please select at one product' };
        }
        return true;
      }
    }
  },
  submit: {
    action: (x) => {
      console.log(x);
    }
  },
  formView: [
    {name: 'Deal With', key: 'type', type: 'enum', values: {person: {name: 'Person'}, company: {name: 'Company'}}},
    {name: 'Name',
      fn: (x) => {
                      // tslint:disable-next-line:triple-equals
                      if (x.type == 'company') {
                        return { key: 'person_id', type: 'autocomplete', from: {
                          type: 'service',
                          value: 'personService.persons'
                        }};
                      } else {
                        return {key: 'name', type: 'normal' };
                      }
                  },
     type: 'conditional'},
    {name: 'Delivery Date', key: 'delivery_date', type: 'normal'},
    {name: 'Description', key: 'description', type: 'notimportant'},
    {name: 'Created By', key: 'created_by', type: 'autocomplete', from: {
      type: 'service',
      value: 'userService.subjects'
    }},
    {name: 'Date & Time', key: 'created_datetime', type: 'normal'},
    { name: 'List of Products',
      key: 'items',
      type: 'multipleChildren',
      formView: [
          {
            name: 'Products',
            key: 'product_id',
            type: 'autocomplete',
            from: {
              type: 'service',
              value: 'productService.products'
            },
            value: '',
            valuefull: ''
          },
          {
            name: 'Code',
            key: 'product_sku',
            type: 'normal'
          },
          {
            name: 'Order Qty',
            key: 'quantity',
            type: 'normal',
            value: 1
          },
          {
            name: 'Available Qty',
            key: 'product_id',
            type: 'async',
            value: (service, id, x) => {
              return service.inventoryService.getQuantity(id).pipe(
                map((res: any) => {
                  return x.available_qty = res;

                }));
            },
            valuefull: ''
          },
          {
            name: 'Need Qty',
            type: 'calculate',
            value: (x) => {
              // tslint:disable-next-line:radix
              return parseInt(x.quantity) - parseInt(x.available_qty) ;
            }
          },
        ]
      },
  ],
  stock: false
};



