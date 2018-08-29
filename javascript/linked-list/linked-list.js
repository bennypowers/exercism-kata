const List = Array;
List.prototype.count = function () { return this.length; };
List.prototype.delete = function (value) {
  return this.indexOf(value) !== -1
    ? this.splice(this.indexOf(value), 1)
    : this;
};

export default List;