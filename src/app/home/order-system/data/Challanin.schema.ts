import { validateOption, validateId, validateName, productStr } from './Const';

export const ChallaninSchema: any = {
  name: 'Challan In',
  object: 'challanin',
  mulitname: 'Challan In',
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
      matches: [{ key: 'name', typeof: 'string' }],
      callback: (x, form) => {
        form.value = x.id;
        form.searchList = [];
        form.typing = x.name + '| Address: ' + x.street + ' ' + x.city + ' ' + x.state;
        form.valuefull = Object.assign({}, x);
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
    description: {
      name: 'Description',
      type: 'textarea',
      default: '',
      value: '',
      order: 4
    },
    cases: {
      name: 'Cases',
      type: 'number',
      default: 1,
      value: 1,
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
          matches: [{ key: 'name', typeof: 'string' }, { key: 'sku', typeof: 'string' }],
          typing: '',
          searchList: [],
          viewCallback: (x) => productStr(x),
          callback: (x, form) => {
            form.value = x.id;
            form.valuefull = Object.assign({}, x);
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
            const obj = Object.assign({}, x);
            parent.items.value.push(obj);
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

    }
  },
  formView: [
    { name: 'RefNo', key: 'id', type: 'normal' },
    { name: 'Deal With', key: 'type', type: 'enum', values: { person: { name: 'Person' }, company: { name: 'Company' } } },
    {
      name: 'Name',
      fn: (x) => {
        // tslint:disable-next-line:triple-equals
        if (x.type == 'company') {
          return {
            key: 'person_id', type: 'autocomplete', from: {
              type: 'service',
              value: 'personService.persons',
            },
            viewCallback: (res: any) => {
              return res.name + ' | Address: ' + res.street + ' ' + res.city + ' ' + res.state;
            }
          };
        } else {
          return { key: 'name', type: 'normal' };
        }
      },
      type: 'conditional'
    },
    { name: 'Description', key: 'description', type: 'notimportant' },
    { name: 'Cases', key: 'cases', type: 'normal' },
    {
      name: 'Created By', key: 'created_by', type: 'autocomplete', from: {
        type: 'service',
        value: 'userService.subjects'
      }, viewCallback: (x: any) => {
        return x.name;
      }
    },
    { name: 'Status', key: 'status', type: 'enum',
      values: {
        init: { name: 'Initialize' },
        stockin: { name: 'Stock In' },
        deleted: { name: 'Deleted' }
      }
    },
    { name: 'Date & Time', key: 'created_datetime', type: 'normal' },
    {
      name: 'List of Products',
      key: 'items',
      type: 'multipleChildren',
      formView: [
        {
          name: 'Products',
          key: 'product_id',
          type: 'autocomplete',
          from: {
            type: 'service',
            value: 'productService.products',
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
        }
      ]

    },
  ],
  stock: { name: 'Stock In', fn: 'stockIn' }
};



