<?php
require_once('classes/ForgetPassword.php');
$user = new ForgetPassword();
?>
<style>
    body {
        background-color: whitesmoke;
    }
</style>
<div class="right">
    <form action="" method="post" id="formDemo" class="form">
        <div class="form-login">
            <table>
                <tr>
                    <p style="margin-bottom: 20px" class="title">Đổi mật khẩu</p>
                </tr>
                <hr>
                <?php
                if (isset($_POST['submit'])) {
                    $error = array();
                    if ($_POST['repass'] != $_POST['newpass']) {
                        $error['fail'] = 'Nhập lại mật khẩu không khớp!';
                    } else {
                        $error['success'] = 'Đổi mật khẩu thành công!';
                        $user->forgetPass($_POST['newpass'], $_SESSION['mail']);
                    }
                }
                ?>
                <tr>
                    <?php if (isset($error['fail'])) : ?>
                        <div class="alert alert-danger" role="alert">
                            <?= $error['fail'] ?>
                        </div>
                    <?php elseif (isset($error['success'])) : ?>
                        <div class="alert alert-success" role="alert">
                            <?= $error['success'] ?>
                        </div>
                    <?php else : ?>
                        <div class="alert alert-primary" role="alert">
                            Đổi mật khẩu mới tại đây
                        </div>
                    <?php endif; ?>

                </tr>
                <tr>
                    <input type="text" name="newpass" class="control-login" value="<?php if (isset($_POST['newpass'])) echo $_POST['newpass'] ?>" placeholder="Nhập mật khẩu mới"> <br>
                </tr>
                <br>
                <tr>
                    <input type="text" name="repass" class="control-login" value="<?php if (isset($_POST['repass'])) echo $_POST['repass'] ?>" placeholder="Nhập mật khẩu mới">
                </tr>
                <br>
                <tr><br>
                    <div class="login">
                        <button class="login btn btn-light" type="submit" name="submit">Gửi</button>
                    </div>
                </tr>
            </table>
        </div>
    </form>
</div>