<?php
$products = $conn->query("SELECT * FROM `products`  where md5(id) = '{$_GET['id']}' ");
if ($products->num_rows > 0) {
    foreach ($products->fetch_assoc() as $k => $v) {
        $$k = stripslashes($v);
    }
    $upload_path = base_app . '/uploads/product_' . $id;
    $img = "";
    if (is_dir($upload_path)) {
        $fileO = scandir($upload_path);
        if (isset($fileO[2]))
            $img = "uploads/product_" . $id . "/" . $fileO[2];
        // var_dump($fileO);
    }
    $inventory = $conn->query("SELECT * FROM inventory where product_id = " . $id);
    $inv = array();
    while ($ir = $inventory->fetch_assoc()) {
        $inv[] = $ir;
    }
}
?>
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">

            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0 " loading="lazy" id="display-img"
                         src="<?php echo validate_image($img) ?>" alt="..."/>
                    <div class="mt-2 row gx-2 gx-lg-3 row-cols-4 row-cols-md-3 row-cols-xl-4 justify-content-start">
                        <?php
                        foreach ($fileO as $k => $img):
                            if (in_array($img, array('.', '..')))
                                continue;
                            ?>
                            <div class="col">
                                <a href="javascript:void(0)"
                                   class="view-image <?php echo $k == 2 ? "active" : '' ?>"><img
                                            src="<?php echo validate_image('uploads/product_' . $id . '/' . $img) ?>"
                                            loading="lazy" class="img-thumbnail" alt=""></a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- <div class="small mb-1">SKU: BST-498</div> -->
                    <h1 class="display-5 border-bottom border-primary pb-1"><?php echo $title ?></h1>
                    <p class="m-0">
                        <small>Tác giả: <?php echo $author ?></small>
                    </p>
                    <div class="fs-5 mb-5">
                        <span id="price"><?php echo number_format($inv[0]['price']) ?>&#8363;</span>
                        <br>
                        <span><small><b>Còn lại:</b> <span
                                        id="avail"><?php echo $inv[0]['quantity'] ?></span></small></span>
                    </div>
                    <form action="" id="add-cart">
                        <div class="d-flex">
                            <input type="hidden" name="price" value="<?php echo $inv[0]['price'] ?>">
                            <input type="hidden" name="inventory_id" value="<?php echo $inv[0]['id'] ?>">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1"
                                   style="max-width: 3rem" name="quantity"/>
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Thêm vào giỏ hàng
                            </button>
                        </div>
                    </form>
                    <p class="lead"><?php echo stripslashes(html_entity_decode($description)) ?></p>

                </div>
            </div>
        </div>
    </section>
    <!-- Related items section-->
    <section class="py-5" style="background-color: whitesmoke">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="mb-4">Sách cùng chuyên mục</h2>
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <?php
                $products = $conn->query("SELECT * FROM `products` where status = 1 and (category_id = '{$category_id}' or sub_category_id = '{$sub_category_id}') and id !='{$id}' order by rand() limit 4 ");
                while ($row = $products->fetch_assoc()):
                $upload_path = base_app . '/uploads/product_' . $row['id'];
                $img = "";
                if (is_dir($upload_path)) {
                    $fileO = scandir($upload_path);
                    if (isset($fileO[2]))
                        $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                    // var_dump($fileO);
                }
                $inventory = $conn->query("SELECT * FROM inventory where product_id = " . $row['id']);
                $_inv = array();
                foreach ($row as $k => $v) {
                    $row[$k] = trim(stripslashes($v));
                }
                while ($ir = $inventory->fetch_assoc()) {
                    $_inv[] = number_format($ir['price']);
                }
                ?>
                <div class="col mb-5">

                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                <div class="card h-100 product-item">
                                    <!-- Product image-->
                                    <img class="card-img-top w-100" src="<?php echo validate_image($img) ?>" alt="..."/>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"
                                                title="<?php echo $row['title']; ?>"><?php echo truncate($row['title'], 38) ?></h5>
                                        </div>
                                    </div>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
            <?php endwhile; ?>
        </div>
        </div>
    </section>
    <!--Product rating-->
    <section class="py-5" style="background-color: white">
        <div class="container px-4 px-lg-5 mt-5">
            <h1 class="mt-5 mb-5">Đánh giá sản phẩm</h1>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <h1 class="text-warning mt-4 mb-4">
                                <b><span id="average_rating">0.0</span> / 5</b>
                            </h1>
                            <div class="mb-3">
                                <i class="fas fa-star star-light mr-1 main_star"></i>
                                <i class="fas fa-star star-light mr-1 main_star"></i>
                                <i class="fas fa-star star-light mr-1 main_star"></i>
                                <i class="fas fa-star star-light mr-1 main_star"></i>
                                <i class="fas fa-star star-light mr-1 main_star"></i>
                            </div>
                            <h3><span id="total_review">0</span> Đánh giá</h3>
                        </div>
                        <div class="col-sm-4">
                            <p>
                            <div class="progress-label-left"><b>5</b> <i class="fas fa-star text-warning"></i></div>

                            <div class="progress-label-right">(<span id="total_five_star_review">0</span>)</div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="0"
                                     aria-valuemin="0" aria-valuemax="100" id="five_star_progress"></div>
                            </div>
                            </p>
                            <p>
                            <div class="progress-label-left"><b>4</b> <i class="fas fa-star text-warning"></i></div>

                            <div class="progress-label-right">(<span id="total_four_star_review">0</span>)</div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="0"
                                     aria-valuemin="0" aria-valuemax="100" id="four_star_progress"></div>
                            </div>
                            </p>
                            <p>
                            <div class="progress-label-left"><b>3</b> <i class="fas fa-star text-warning"></i></div>

                            <div class="progress-label-right">(<span id="total_three_star_review">0</span>)</div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="0"
                                     aria-valuemin="0" aria-valuemax="100" id="three_star_progress"></div>
                            </div>
                            </p>
                            <p>
                            <div class="progress-label-left"><b>2</b> <i class="fas fa-star text-warning"></i></div>

                            <div class="progress-label-right">(<span id="total_two_star_review">0</span>)</div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="0"
                                     aria-valuemin="0" aria-valuemax="100" id="two_star_progress"></div>
                            </div>
                            </p>
                            <p>
                            <div class="progress-label-left"><b>1</b> <i class="fas fa-star text-warning"></i></div>

                            <div class="progress-label-right">(<span id="total_one_star_review">0</span>)</div>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="0"
                                     aria-valuemin="0" aria-valuemax="100" id="one_star_progress"></div>
                            </div>
                            </p>
                        </div>
                        <div class="col-sm-4 text-center">
                            <h3 class="mt-4 mb-3">Bình luận tại đây</h3>
                            <button type="button" name="add_review" id="add_review" class="btn btn-primary">Đánh giá
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-5" id="review_content"></div>
        </div>
        </body>
        </html>

        <div id="review_modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Gửi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4 class="text-center mt-2 mb-4">
                            <i class="fas fa-star star-light submit_star mr-1" id="submit_star_1" data-rating="1"></i>
                            <i class="fas fa-star star-light submit_star mr-1" id="submit_star_2" data-rating="2"></i>
                            <i class="fas fa-star star-light submit_star mr-1" id="submit_star_3" data-rating="3"></i>
                            <i class="fas fa-star star-light submit_star mr-1" id="submit_star_4" data-rating="4"></i>
                            <i class="fas fa-star star-light submit_star mr-1" id="submit_star_5" data-rating="5"></i>
                        </h4>
                        <div class="form-group">
                            <input type="text" name="user_name" id="user_name" class="form-control"
                                   placeholder="Tên của bạn"/>
                        </div>
                        <div class="form-group">
                            <textarea name="user_review" id="user_review" class="form-control"
                                      placeholder="Đánh giá tại đây"></textarea>
                        </div>
                        <div class="form-group text-center mt-4">
                            <button type="button" class="btn btn-primary" id="save_review">Gửi</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <script>
        var inv = $.parseJSON('<?php echo json_encode($inv) ?>');
        $(function () {
            $('.view-image').click(function () {
                var _img = $(this).find('img').attr('src');
                $('#display-img').attr('src', _img);
                $('.view-image').removeClass("active")
                $(this).addClass("active")
            })
            $('.p-size').click(function () {
                var k = $(this).attr('data-id');
                $('.p-size').removeClass("active")
                $(this).addClass("active")
                $('#price').text(inv[k].price)
                $('[name="price"]').val(inv[k].price)
                $('#avail').text(inv[k].quantity)
                $('[name="inventory_id"]').val(inv[k].id)

            })

            $('#add-cart').submit(function (e) {
                e.preventDefault();
                if ('<?php echo $_settings->userdata('id') ?>' <= 0) {
                    uni_modal("", "login.php");
                    return false;
                }
                start_loader();
                $.ajax({
                    url: 'classes/Master.php?f=add_to_cart',
                    data: $(this).serialize(),
                    method: 'POST',
                    dataType: "json",
                    error: err => {
                        console.log(err)
                        alert_toast("an error occured", 'error')
                        end_loader()
                    },
                    success: function (resp) {
                        if (typeof resp == 'object' && resp.status == 'success') {
                            alert_toast("Product added to cart.", 'success')
                            $('#cart-count').text(resp.cart_count)
                        } else {
                            console.log(resp)
                            alert_toast("an error occured", 'error')
                        }
                        end_loader();
                    }
                })
            })
        })

        // Review sp
        var rating_data = 0;

        $('#add_review').click(function () {

            $('#review_modal').modal('show');

        });

        $(document).on('mouseenter', '.submit_star', function () {

            var rating = $(this).data('rating');

            reset_background();

            for (var count = 1; count <= rating; count++) {

                $('#submit_star_' + count).addClass('text-warning');

            }

        });

        function reset_background() {
            for (var count = 1; count <= 5; count++) {

                $('#submit_star_' + count).addClass('star-light');

                $('#submit_star_' + count).removeClass('text-warning');

            }
        }

        $(document).on('mouseleave', '.submit_star', function () {

            reset_background();

            for (var count = 1; count <= rating_data; count++) {

                $('#submit_star_' + count).removeClass('star-light');

                $('#submit_star_' + count).addClass('text-warning');
            }

        });

        $(document).on('click', '.submit_star', function () {

            rating_data = $(this).data('rating');

        });

        // Hiển thị đánh giá
        $('#save_review').click(function () {

            var user_name = $('#user_name').val();

            var user_review = $('#user_review').val();

            if (user_name == '' || user_review == '') {
                alert("Vui lòng điền đầy đủ các trường");
                return false;
            }
            else {
                $.ajax({
                    url: "submit_rating.php",
                    method: "POST",
                    data: {rating_data: rating_data, user_name: user_name, user_review: user_review},
                    success: function (data) {
                        $('#review_modal').modal('hide');

                        load_rating_data();

                        alert(data);
                    }
                })
            }

        });

        load_rating_data();

        function load_rating_data() {
            $.ajax({
                url: "submit_rating.php",
                method: "POST",
                data: {action: 'load_data'},
                dataType: "JSON",
                success: function (data) {
                    $('#average_rating').text(data.average_rating);
                    $('#total_review').text(data.total_review);

                    var count_star = 0;

                    $('.main_star').each(function () {
                        count_star++;
                        if (Math.ceil(data.average_rating) >= count_star) {
                            $(this).addClass('text-warning');
                            $(this).addClass('star-light');
                        }
                    });

                    $('#total_five_star_review').text(data.five_star_review);

                    $('#total_four_star_review').text(data.four_star_review);

                    $('#total_three_star_review').text(data.three_star_review);

                    $('#total_two_star_review').text(data.two_star_review);

                    $('#total_one_star_review').text(data.one_star_review);

                    $('#five_star_progress').css('width', (data.five_star_review / data.total_review) * 100 + '%');

                    $('#four_star_progress').css('width', (data.four_star_review / data.total_review) * 100 + '%');

                    $('#three_star_progress').css('width', (data.three_star_review / data.total_review) * 100 + '%');

                    $('#two_star_progress').css('width', (data.two_star_review / data.total_review) * 100 + '%');

                    $('#one_star_progress').css('width', (data.one_star_review / data.total_review) * 100 + '%');

                    if (data.review_data.length > 0) {
                        var html = '';

                        for (var count = 0; count < data.review_data.length; count++) {
                            html += '<div class="row mb-3">';

                            html += '<div class="col-sm-1"><div class="rounded-circle bg-danger text-white pt-2 pb-2"><h3 class="text-center">' + data.review_data[count].user_name.charAt(0) + '</h3></div></div>';

                            html += '<div class="col-sm-11">';

                            html += '<div class="card">';

                            html += '<div class="card-header"><b>' + data.review_data[count].user_name + '</b></div>';

                            html += '<div class="card-body">';

                            for (var star = 1; star <= 5; star++) {
                                var class_name = '';

                                if (data.review_data[count].rating >= star) {
                                    class_name = 'text-warning';
                                }
                                else {
                                    class_name = 'star-light';
                                }

                                html += '<i class="fas fa-star ' + class_name + ' mr-1"></i>';
                            }

                            html += '<br />';

                            html += data.review_data[count].user_review;

                            html += '</div>';

                            html += '<div class="card-footer text-right">On ' + data.review_data[count].datetime + '</div>';

                            html += '</div>';

                            html += '</div>';

                            html += '</div>';
                        }

                        $('#review_content').html(html);
                    }
                }
            })
        }
    </script>

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