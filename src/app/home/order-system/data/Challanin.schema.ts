export const ChallaninSchema: any = {
  name: 'Challan In',
  mulitname: 'Challan In',
  itemAdd: {
      product: {
              name: 'Select Product',
              type: 'autocomplete',
              from: {
                      type: 'service',
                      value: 'productService.products'
                    },
              default: 0,
              value: 0
            },
      quantity: {
        name: 'Qunatity',
        type: 'number',
        default: 1,
        value: 0
      }
  },
  formAdd: {
    type: {
            name: 'Deal With',
            type: 'radio',
            option: [{key: 'company', value: 'Company'},
                     {key: 'person', value: 'Person'},
                    ],
            defult: 'company',
            value: 'company',
            order: 1
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
                  },
                  from: {
                          type: 'service',
                          value: 'subjectService.subjects'
                        },
                  default: 0,
                  value: 0,
                  if: (x) => {
                      if ( x.type.value === 'company' ) {
                       return true;
                      }
                      return false;
                  },
                  order: 2
              },
    name: {
            name: 'Name of Person',
            type: 'text',
            default: '',
            value: '',
            if: (x) => {
              if ( x.type.value === 'person' ) {
                return true;
              }
              return false;
            },
            order: 3
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
    created_by: {
              type: 'hidden',
              from: {
                      type: 'service',
                      value: 'userService.current'
                    },
              order: 6
            },
    items: {
            name: 'List of Products',
            buttonName: 'Add Product',
            type: 'multipleChildren',
            from: {
                    type: 'form'
                  },
            value: () => {
              return ChallaninSchema.itemAdd;
            },
            default: [],
            order: 7
          }
  }
};



