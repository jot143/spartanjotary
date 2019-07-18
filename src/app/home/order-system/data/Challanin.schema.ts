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

export const ChallaninSchema: any = {
  name: 'Challan In',
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
          typing: '',
          searchList: [],
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
        quantity: {
          name: 'Qunatity',
          type: 'number',
          default: 1,
          value: 1,
          min: 1,
          validate: (x) => {
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
  }
};



