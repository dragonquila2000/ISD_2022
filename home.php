<!-- Section-->
<style>
    .book-cover {
        object-fit: contain !important;
        height: auto !important;
    }

    .home-title {
        background-image: linear-gradient(to bottom, #ccc 0px, #f5f5f5 100%);
        border: 1px solid #e5e5e5;
        border-radius: 3px;
        height: 50px;
        width: 100%;
        margin-bottom: 20px;
        position: relative;
    }

    .home-title h2 {
        float: left;
        height: 100%;
        margin-left: 0;
        padding: 4px 10px;
        position: relative;
        line-height: 33px;
        font-size: 25px;
        border-bottom: 2px solid #d82028;
    }
</style>
<section class="py-0">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row" style="border: 1px solid #f0f0f0; box-shadow: #f0f0f0; padding: 20px; background-color: whitesmoke">
            <div id="carouselExampleSlidesOnly" class="carousel slide col-md-8 mb-5" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="assets/images/b1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/b2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/b5.jpg" alt="Third slide">
                    </div>
                </div>
            </div>
            <div class="ads col-md-4">
                <img src="assets/images/b3.jpg" style="width: 381px; height: 329px">
            </div>
        </div>

        <div class="home-title mt-5">
            <h2>Sách ngoại ngữ</h2>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php
            $products = $conn->query("SELECT * FROM `products` where status = 1 and category_id = 5 order by rand() limit 8 ");
            while ($row = $products->fetch_assoc()) :
                $upload_path = base_app . '/uploads/product_' . $row['id'];
                $img = "";
                if (is_dir($upload_path)) {
                    $fileO = scandir($upload_path);
                    if (isset($fileO[2]))
                        $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                    // var_dump($fileO);
                }
                foreach ($row as $k => $v) {
                    $row[$k] = trim(stripslashes($v));
                }
                $inventory = $conn->query("SELECT * FROM inventory where product_id = " . $row['id']);
                $inv = array();
                while ($ir = $inventory->fetch_assoc()) {
                    $inv[] = number_format($ir['price']);
                }
            ?>

                <div class="col mb-5">
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                <div class="card product-item">
                                    <!-- Product image-->
                                    <img class="card-img-top w-100 book-cover" src="<?php echo validate_image($img) ?>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder" title="<?php echo $row['title']; ?>"><?php echo truncate($row['title'], 38) ?></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>

        <div class="home-title mt-5">
            <h2>Sách cấp 1</h2>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php
            $products = $conn->query("SELECT * FROM `products` where status = 1 and category_id = 6 order by rand() limit 8 ");
            while ($row = $products->fetch_assoc()) :
                $upload_path = base_app . '/uploads/product_' . $row['id'];
                $img = "";
                if (is_dir($upload_path)) {
                    $fileO = scandir($upload_path);
                    if (isset($fileO[2]))
                        $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                    // var_dump($fileO);
                }
                foreach ($row as $k => $v) {
                    $row[$k] = trim(stripslashes($v));
                }
                $inventory = $conn->query("SELECT * FROM inventory where product_id = " . $row['id']);
                $inv = array();
                while ($ir = $inventory->fetch_assoc()) {
                    $inv[] = number_format($ir['price']);
                }
            ?>

                <div class="col mb-5">
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                <div class="card product-item">
                                    <!-- Product image-->
                                    <img class="card-img-top w-100 book-cover" src="<?php echo validate_image($img) ?>" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder" title="<?php echo $row['title']; ?>"><?php echo truncate($row['title'], 38) ?></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>
<?php
function truncate($text, $chars)
{
    if (strlen($text) <= $chars) {
        return $text;
    }
    $text = $text . " ";
    $text = substr($text, 0, $chars);
    $text = substr($text, 0, strrpos($text, ' '));
    $text = $text . "...";
    return $text;
}
?>