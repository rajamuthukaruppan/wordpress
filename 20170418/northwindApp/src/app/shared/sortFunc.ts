export function sortString(arrayToSort, field, fieldOrder) {
    if(fieldOrder.order==-1 || fieldOrder.order==0) { // sort Asc
        fieldOrder.order = 1;
    } else if(fieldOrder.order == 1) { // sort desc
        fieldOrder.order = -1;
    }
    arrayToSort.sort((a,b) : number => {
        if(a[field]==null) return -1;
        if(b[field]==null) return 1;
        if(a[field].toUpperCase() < b[field].toUpperCase()) return -fieldOrder.order;
        if(a[field].toUpperCase() > b[field].toUpperCase()) return fieldOrder.order;
        return 0;
    });
}

export function sortNumber(arrayToSort, field, fieldOrder) {
    if(fieldOrder.order==-1 || fieldOrder.order==0) { // sort Asc
      fieldOrder.order = 1;
    } else if(fieldOrder.order == 1) { // sort desc
      fieldOrder.order = -1;
    }
    arrayToSort.sort((a,b) : number => {
      if(a[field]==null) return -1;
      if(b[field]==null) return 1;
      if(a[field] < b[field]) return -fieldOrder.order;
      if(a[field] > b[field]) return fieldOrder.order;
      return 0;
    });
}