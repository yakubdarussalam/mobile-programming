import 'package:flutter/material.dart';
import 'package:flutter_restapi/product_controller.dart';
import 'package:flutter_restapi/product_detail.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter RestAPI"),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createProduct();
          Get.to(ProductDetail());
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => Container(
            padding: EdgeInsets.all(16),
            child: controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 300,
                        mainAxisSpacing: 10),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return InkWell(
                        onTap: () async {
                          await controller.getProduct(product.id);
                          Get.to(ProductDetail());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  product.thumbnail,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.category,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(product.title, maxLines: 2),
                                    Text(
                                      "\$${product.price}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "${product.rating} | Stock ${product.stock}",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}