<div class="right">
    <form action="" method="post" id="formDemo" class="form">
        <div class="form-login">
            <table>
                <tr>
                    <p style="margin-bottom: 20px" class="title">Đổi mật khẩu</p>
                </tr>
                <?php
                if (isset($_POST['submit'])) {
                    $error = array();
                    if ($_POST['repass'] != $_POST['newpass']) {
                        $error['fail'] = 'Nhập lại mật khẩu không khớp';
                    } else {
                        $error['success'] = 'Đổi mật khẩu thành công!';
                        $users->forgetPass($_POST['newpass'], $_SESSION['mail']);
                        echo '<script>location.href = "./?p=home";</script>';
                    }
                }
                ?>
                <tr>
                    <?php if (isset($error['fail'])) : ?>
                        <div class="alert alert-primary" role="alert">
                            <?= $error['fail'] ?>
                        </div>
                    <?php elseif (isset($error['success'])) : ?>
                        <div class="alert alert-primary" role="alert">
                            <?= $error['success'] ?>
                        </div>
                    <?php else : ?>
                    <div class="alert alert-primary" role="alert">
                        Đổi mật khẩu mới tại đây
                    </div>
                    <?php endif; ?>
                </tr>
                <tr>
                    <input type="text" name="newpass" class="control-login"
                           value="<?php if (isset($_POST['newpass'])) echo $_POST['newpass'] ?>"
                           placeholder="Nhập mật khẩu mới"> <br>
                </tr>
                <br>
                <tr>
                    <input type="text" name="repass" class="control-login"
                           value="<?php if (isset($_POST['repass'])) echo $_POST['repass'] ?>"
                           placeholder="Xác nhận mật khẩu">
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