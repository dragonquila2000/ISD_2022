<?php
require_once 'forgot_passwd.php';
?>
<div class="right">
    <form action="verification.php" method="post" id="formDemo" class="form">
        <div class="form-login">
            <table>

                <tr>
                    <p style="margin-bottom: 20px" class="title">Nhập mã xác nhận</p>
                </tr>
                <tr>
                    <?php if (isset($_POST['submit'])) {
                        $error = array();
                        if ($_POST['text'] != $_SESSION['code']) {
                            $error['fail'] = 'Mã xác nhận không hợp lệ';
                        } else {
                            echo '<script>location.href = "./?p=resetPass";</script>';
                        }
                    }
                    ?>
                </tr>
                <tr>
                    <?php if (isset($error['fail'])): ?>
                        <div class="alert alert-primary" role="alert">
                            <?= $error['fail'] ?>
                        </div>
                    <?php else : ?>
                        <div class="alert alert-primary" role="alert">
                            Hãy nhập mã xác nhận mà chúng tôi đã gửi cho bạn về email
                        </div>
                    <?php endif ?>

                </tr>
                <tr>
                    <input type="text" class="control-login" name="text" placeholder="Nhập mã xác nhận">
                </tr>
                <tr><br><br>
                    <div class="login">
                        <button class="login btn btn-light" type="submit" name="submit">Gửi</button>
                    </div>
                </tr>
            </table>
        </div>
    </form>
</div>