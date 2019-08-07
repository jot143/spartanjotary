import { validateOption, validateId, validateName, productStr } from './Const';

export const PurchaseSchema: any = {
  name: 'Purchase Order',
  object: 'purchase',
  mulitname: 'Purchase Orders',
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
      viewCallback: (x) => {
        return x.name + '| Address: ' + x.street + ' ' + x.city + ' ' + x.state;
      },
      callback: (x, form) => {
        form.value = x.id;
        form.searchList = [];
        form.typing = x.name + '| Address: ' + x.street + ' ' + x.city + ' ' + x.state;
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
    quotation_ref: {
      name: 'Quotation Ref No',
      type: 'text',
      default: '',
      value: '',
      order: 4
    },
    gst_type: {
      name: 'GST Type',
      type: 'radio',
      option: [{ key: 'sgst-cgst', value: 'SGST-CGST' },
               { key: 'igst', value: 'IGST' },
      ],
      defult: 'sgst-cgst',
      value: 'sgst-cgst',
      order: 5,
      validate: validateOption
    },
    contact_number: {
      name: 'Contact Number',
      type: 'text',
      default: '0181-5056987',
      value: '0181-5056987',
      order: 6
    },
    contact_person: {
      name: 'Contact Person',
      type: 'text',
      default: 'Prabhdeep Singh Nijjar',
      value: 'Prabhdeep Singh Nijjar',
      order: 7
    },
    payment_terms: {
      name: 'Payment Term`s',
      type: 'text',
      default: 'After Delivery',
      value: 'After Delivery',
      order: 8
    },
    ship_to: {
      name: 'Ship To',
      type: 'text',
      default: 'Spartan Internatinal',
      value: 'Spartan Internatinal',
      order: 9
    },
    bill_to: {
      name: 'Bill To',
      type: 'text',
      default: 'Spartan Internatinal',
      value: 'Spartan Internatinal',
      order: 10
    },
    ship_via: {
      name: 'Ship Via',
      type: 'text',
      default: '',
      value: '',
      order: 11
    },
    delivery_date: {
      name: 'Delivery Date',
      type: 'text',
      default: '',
      value: '',
      order: 12
    },
    delivery_terms: {
      name: 'Delivery Term`s',
      type: 'textarea',
      default: '',
      value: '',
      order: 13
    },
    description: {
      name: 'Description',
      type: 'textarea',
      default: '',
      value: '',
      order: 14
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
          matches: [{key: 'name', typeof: 'string'}, {key: 'sku', typeof: 'string'}],
          typing: '',
          searchList: [],
          viewCallback: (x) => productStr(x),
          callback: (x, form) => {
            form.value = x.id;
            form.valuefull = x;
            form.searchList = [];
            form.typing = productStr(x);
          },
          from: {
            type: 'service',
            value: 'productService.products'
          },
          default: 0,
          value: 0,
          valuefull: {},
          validate: validateId,
          order: 1
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
          },
          order: 2
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
          },
          order: 3
        },
        price: {
          name: 'Price',
          type: 'text',
          default: 0,
          value: 0,
          min: 0,
          validate: (x, formData) => {
            // tslint:disable-next-line:radix
            x.value = parseInt(x.value);
            // tslint:disable-next-line:triple-equals
            if (typeof x.value == 'undefined' || x.value < x.min) {
              return { status: false, msg: 'Minimum price must be ' + x.min };
            }

            if (Number.isInteger(x.value) === false) {
              return { status: false, msg:  x.name + ' must be a integer' };
            }
            return true;
          },
          order: 4
        },
        discount_percent: {
          name: 'Discount Percentage',
          type: 'text',
          default: 0,
          value: 0,
          min: 0,
          max: 100,
          validate: (x, formData) => {
            // tslint:disable-next-line:radix
            x.value = parseInt(x.value);
            // tslint:disable-next-line:triple-equals
            if (typeof x.value == 'undefined' || x.value < x.min) {
              return { status: false, msg: 'Minimum discount must be ' + x.min };
            }

            if (x.value > x.max) {
              return { status: false, msg: 'Maximum discount must be ' + x.min };
            }

            if (Number.isInteger(x.value) === false) {
              return { status: false, msg: 'Please ' + x.name + ', is not integer' };
            }
            return true;
          },
          order: 5
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
      order: 15,

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
    {name: 'RefNo', key: 'id', type: 'normal'},
    {name: 'Deal With', key: 'type', type: 'enum', values: {person: {name: 'Person'}, company: {name: 'Company'}}},
    {name: 'Name',
      fn: (x) => {
                      // tslint:disable-next-line:triple-equals
                      if (x.type == 'company') {
                        return { key: 'person_id', type: 'autocomplete', from: {
                          type: 'service',
                          value: 'personService.persons'
                        },
                        viewCallback: (res: any) => {
                          return res.name + ' | Address: ' + res.street + ' ' + res.city + ' ' + res.state;
                        }
                      };
                      } else {
                        return {key: 'name', type: 'normal' };
                      }
                  },
     type: 'conditional'},
    {name: 'Quotation RefNo', key: 'quotation_ref', type: 'normal'},
    {name: 'GST Type', key: 'gst_type', type: 'enum', values: { 'sgst-cgst': {name: 'SGST-CGST'}, igst: {name: 'IGST'}}},
    {name: 'Bill To', key: 'bill_to', type: 'notimportant'},
    {name: 'Contact Person', key: 'contact_person', type: 'notimportant'},
    {name: 'Contact Number', key: 'contact_number', type: 'notimportant'},
    {name: 'Ship To', key: 'ship_to', type: 'notimportant'},
    {name: 'Ship Via', key: 'ship_via', type: 'notimportant'},
    {name: 'Delivery Date', key: 'delivery_date', type: 'notimportant'},
    {name: 'Delivery Terms', key: 'delivery_terms', type: 'notimportant'},
    {name: 'Payment Terms', key: 'payment_terms', type: 'notimportant'},
    {name: 'Description', key: 'description', type: 'notimportant'},
    {name: 'Created By', key: 'created_by', type: 'autocomplete', from: {
      type: 'service',
      value: 'userService.subjects',

    }, viewCallback: (x: any) => {
      return x.name;
    }},
    {name: 'Status', key: 'status', type: 'enum',
    values: {init: {name: 'Initialize'}, stockin: {name: 'Stock In'}, deleted: { name: 'Deleted' }}},
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
            valuefull: '',
            viewCallback: (x) => productStr(x),
          },
          {
            name: 'Code',
            key: 'product_sku',
            type: 'normal'
          },
          {
            name: 'Qunatity',
            key: 'quantity',
            type: 'normal',
            value: 1
          },
          {
            name: 'Price',
            key: 'price',
            type: 'normal',
            value: 0
          },
          {
            name: 'Dist. %',
            key: 'discount_percent',
            type: 'normal',
            value: 0
          },
          {
            name: 'GST %',
            key: 'gstpercentage',
            type: 'autocompleteDetail',
            from: 'product_id_detail',
          },
          {
            name: 'Total',
            type: 'calculate',
            value: (x) => {
              // tslint:disable-next-line:radix
              return parseInt(x.price) + (x.price * x.product_id_detail.gstpercentage / 100);
            }
          }
        ]
      },
  ],
  stock: { name: 'Stock In', fn: 'stockIn'}
};



