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

export const SaleSchema: any = {
  name: 'Sale Order',
  object: 'sale',
  mulitname: 'Sale Orders',
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
        value: 'subjectService.subjects'
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
    purchase_ref: {
      name: 'Purchase Ref No',
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
    cases: {
      name: 'Cases',
      type: 'number',
      default: 1,
      value: 1,
      order: 6
    },
    contact_number: {
      name: 'Contact Number',
      type: 'text',
      default: '0181-5056987',
      value: '0181-5056987',
      order: 7
    },
    contact_person: {
      name: 'Contact Person',
      type: 'text',
      default: 'After Delivery',
      value: 'After Delivery',
      order: 8
    },
    bill_to: {
      name: 'Bill To',
      type: 'text',
      default: '',
      value: '',
      order: 9
    },
    ship_to: {
      name: 'Place of Supply',
      type: 'text',
      default: '',
      value: '',
      order: 10
    },
    ship_via: {
      name: 'Ship Through',
      type: 'text',
      default: '',
      value: '',
      order: 11
    },
    transport_mode: {
      name: 'Transport Mode',
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
    gr_no: {
      name: 'Gr Number',
      type: 'text',
      default: '',
      value: '',
      order: 13
    },
    gr_date: {
      name: 'Gr Date',
      type: 'text',
      default: '',
      value: '',
      order: 14
    },
    discount_percent: {
      name: 'Discount Percentage',
      type: 'number',
      default: 0,
      value: 0,
      order: 15,
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
                          value: 'subjectService.subjects'
                        }};
                      } else {
                        return {key: 'name', type: 'normal' };
                      }
                  },
     type: 'conditional'},
    {name: 'Purchase RefNo', key: 'purchase_ref', type: 'normal'},
    {name: 'Quotation RefNo', key: 'quatation_ref', type: 'normal'},
    {name: 'Cases', key: 'cases', type: 'normal'},
    {name: 'GST Type', key: 'gst_type', type: 'enum', values: { 'sgst-cgst': {name: 'SGST-CGST'}, igst: {name: 'IGST'}}},
    {name: 'Bill To', key: 'bill_to', type: 'notimportant'},
    {name: 'Contact Person', key: 'contact_person', type: 'notimportant'},
    {name: 'Contact Number', key: 'contact_number', type: 'notimportant'},
    {name: 'Ship To', key: 'ship_to', type: 'notimportant'},
    {name: 'Ship Via', key: 'ship_via', type: 'notimportant'},
    {name: 'Transport Mode', key: 'transport_mode', type: 'notimportant'},
    {name: 'Delivery Date', key: 'delivery_date', type: 'notimportant'},
    {name: 'Gr Number', key: 'gr_no', type: 'notimportant'},
    {name: 'Gr Date', key: 'gr_date', type: 'notimportant'},
    {name: 'Description', key: 'description', type: 'notimportant'},
    {name: 'Discount', key: 'discount', type: 'notimportant'},
    {name: 'Created By', key: 'created_by', type: 'autocomplete', from: {
      type: 'service',
      value: 'userService.subjects'
    }},
    {name: 'Status', key: 'status', type: 'enum', values: {init: {name: 'Initialize'}, stockin: {name: 'Stock In'}}},
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
              value: 'userService.subjects'
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
            name: 'Qunatity',
            key: 'quantity',
            type: 'normal',
            value: 1
          },
          {
            name: 'Price',
            key: 'price',
            type: 'text',
            value: 0
          },
          {
            name: 'Discount %',
            key: 'discount_percent',
            type: 'text',
            value: 0
          }
        ]
      },
  ],
  stock: { name: 'Stock Out', fn: 'stockOut'}
};



