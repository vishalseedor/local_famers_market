class Ordermodel {
  final String billingId;
  final String orderStatus;
  final String orderCreated;
  final String cartId;
  final String cartQuantity;
  final String productId;
  final String productName;
  final String productPrice;
  final String productDescription;

  Ordermodel(
      {required this.billingId,
      required this.orderStatus,
      required this.orderCreated,
      required this.cartId,
      required this.cartQuantity,
      required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productDescription});

factory Ordermodel.fromJson(Map<String, dynamic> json) {
  return Ordermodel( 
    billingId:json['billing_id'],
    orderStatus:json['order_status'],
    orderCreated:json['order_created'],
    cartId:json['cart_id'],
    cartQuantity:json['cart_quantity'],
    productId:json['product_id'],
    productName:json['product_name'],
    productPrice:json['product_price'],
    productDescription:json['product_description'],);
   
  }}