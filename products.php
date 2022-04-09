<?php
$title = "";
$sub_title = "";
if (isset($_GET['c']) && isset($_GET['s'])) {
    $cat_qry = $conn->query("SELECT * FROM categories where md5(id) = '{$_GET['c']}'");
    if ($cat_qry->num_rows > 0) {
        $result = $cat_qry->fetch_assoc();
        $title = $result['category'];
        $cat_description = $result['description'];
    }
    $sub_cat_qry = $conn->query("SELECT * FROM sub_categories where md5(id) = '{$_GET['s']}'");
    if ($sub_cat_qry->num_rows > 0) {
        $result = $sub_cat_qry->fetch_assoc();
        $sub_title = $result['sub_category'];
        $sub_cat_description = $result['description'];
    }
} elseif (isset($_GET['c'])) {
    $cat_qry = $conn->query("SELECT * FROM categories where md5(id) = '{$_GET['c']}'");
    if ($cat_qry->num_rows > 0) {
        $result = $cat_qry->fetch_assoc();
        $title = $result['category'];
        $cat_description = $result['description'];
    }
} elseif (isset($_GET['s'])) {
    $sub_cat_qry = $conn->query("SELECT * FROM sub_categories where md5(id) = '{$_GET['s']}'");
    if ($sub_cat_qry->num_rows > 0) {
        $result = $sub_cat_qry->fetch_assoc();
        $sub_title = $result['sub_category'];
        $sub_cat_description = $result['description'];
    }
}
?>
<!-- Section-->
<section class="py-5">
    <div class="container-fluid row">
        <?php if (isset($_GET['c'])): ?>
            <div class="col-md-3 border-right mb-2 pb-3">
                <div class="list-group text-center">
                    <b class="list-group-item"><?php echo $title ?></b>
                    <a href="./?p=products&c=<?php echo $_GET['c'] ?>"
                       class="list-group-item <?php echo !isset($_GET['s']) ? "active" : "" ?>">Tất cả</a>
                    <?php
                    $sub_cat = $conn->query("SELECT * FROM `sub_categories` where md5(parent_id) =  '{$_GET['c']}' ");
                    while ($row = $sub_cat->fetch_assoc()):
                        ?>
                        <a href="./?p=products&c=<?php echo $_GET['c'] ?>&s=<?php echo md5($row['id']) ?>"
                           class="list-group-item  <?php echo isset($_GET['s']) && $_GET['s'] == md5($row['id']) ? "active" : "" ?>"><?php echo $row['sub_category'] ?></a>
                    <?php endwhile; ?>
                </div>
                <hr>
            </div>
        <?php endif; ?>
        <div class="<?php echo isset($_GET['c']) ? 'col-md-9' : 'col-md-10 offset-md-1' ?>">
            <div class="container-fluid p-0">
                <div class="tab-content pt-2">
                    <div class="tab-pane fade show active" id="book">
                        <?php
                        if (isset($_GET['search'])) {
                            echo "<h4 class='text-center'><b>Tìm kiếm sản phẩm '" . $_GET['search'] . "'</b></h4>";
                        }
                        ?>

                        <div class="row gx-2 gx-lg-2 row-cols-1 row-cols-md-3 row-cols-xl-3">

                            <?php
                            $whereData = "";
                            if (isset($_GET['search']))
                                $whereData = " and (title LIKE '%{$_GET['search']}%' or author LIKE '%{$_GET['search']}%' or description LIKE '%{$_GET['search']}%')";
                            elseif (isset($_GET['c']) && isset($_GET['s']))
                                $whereData = " and (md5(category_id) = '{$_GET['c']}' and md5(sub_category_id) = '{$_GET['s']}')";
                            elseif (isset($_GET['c']) && !isset($_GET['s']))
                                $whereData = " and md5(category_id) = '{$_GET['c']}' ";
                            elseif (isset($_GET['s']) && !isset($_GET['c']))
                                $whereData = " and md5(sub_category_id) = '{$_GET['s']}' ";
                            $products = $conn->query("SELECT * FROM `products` where status = 1 {$whereData} order by rand() ");
                            while ($row = $products->fetch_assoc()):
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
                            <div class="col-md-12 mb-5">

                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                            <div class="product-item">
                                                <!-- Product image-->
                                                <img class="w-100" src="<?php echo validate_image($img) ?>"
                                                     loading="lazy" alt="..."/>
                                                <!-- Product details-->
                                                <div class="card-body p-4">
                                                    <div class="">
                                                        <!-- Product name-->
                                                        <h5 class="fw-bolder"><?php echo $row['title'] ?></h5>
                                                    </div>
                                                </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                        <?php
                        if ($products->num_rows <= 0) {
                            echo "<h4 class='text-center'><b>Không có kết quả</b></h4>";
                        }
                        ?>
                    </div>
                </div>
                <div class="tab-pane fade" id="details">
                    <h3 class="text-center"><?php echo $title . " Category" ?></h3>
                    <hr>
                    <div>
                        <?php echo isset($cat_description) ? stripslashes(html_entity_decode($cat_description)) : '' ?>
                    </div>
                    <h3 class="text-center"><?php echo $sub_title ?></h3>
                    <hr>
                    <div>
                        <?php echo isset($sub_cat_description) ? stripslashes(html_entity_decode($sub_cat_description)) : '' ?>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </div>
</section>