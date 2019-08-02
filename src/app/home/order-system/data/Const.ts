export const validateId = (x, form) => {
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

export const validateOption = (x, form) => {
  // tslint:disable-next-line:triple-equals
  if (typeof x.value == 'undefined' || x.option.find((e) => e.key == x.value) === false) {
    return { status: false, msg: 'Please Select' + x.name };
  }
  return true;
};

export const validateName = (x, form) => {
  // tslint:disable-next-line:triple-equals
  if (typeof x.value == 'undefined' || x.value.length < 3) {
    return { status: false, msg: 'Please fill proper name.' };
  }
  return true;
};

export const productStr = (x) => {
 /// console.log(x);
  const sku = (y) => {
    // tslint:disable-next-line:triple-equals
    if (typeof y.sku != 'undefined' && y.sku != '') {
      return ', Code:' + y.sku;
    }
    return '';
  };

  const size = (y) => {
    // tslint:disable-next-line:triple-equals
    if (typeof y.size != 'undefined' && y.size != '') {
      return ', Size:' + y.size;
    }
    return '';
  };

  const color = (y) => {
    // tslint:disable-next-line:triple-equals
    if (typeof y.color != 'undefined' && y.color != '') {
      return ', Color:' + y.color;
    }
    return '';
  };
  return x.name + sku(x) + size(x) + color(x) ;
};
