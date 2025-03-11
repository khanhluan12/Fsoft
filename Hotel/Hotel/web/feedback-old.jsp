<%-- 
    Document   : feedback
    Created on : Jun 10, 2023, 11:25:12 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đánh giá và phản hồi</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                margin-top: 50px;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
                color: #007bff;
            }

            .rating {
                direction: rtl;
                unicode-bidi: bidi-override;
                text-align: center;
                margin-bottom: 20px;
            }

            .rating input {
                display: none;
            }

            .rating label {
                display: inline-block;
                padding: 10px;
                font-size: 24px;
                color: #dcdcdc;
                cursor: pointer;
            }

            .rating label:before {
                content: '\2605';
            }

            .rating input:checked ~ label,
            .rating input:checked ~ label ~ label {
                color: #ffc107;
            }

            .mb-3 {
                margin-bottom: 20px;
            }

            .form-label {
                font-weight: bold;
                color: #007bff;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0069d9;
                border-color: #0062cc;
            }

            .comments {
                margin-top: 20px;
            }

            .comment {
                display: flex;
                align-items: flex-start;
                margin-bottom: 10px;
            }

            .comment-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                overflow: hidden;
                margin-right: 10px;
            }

            .comment-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .comment-content {
                flex-grow: 1;
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
            }

            .comment-name {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .comment-rating {
                margin-bottom: 5px;
            }

            .comment-text {
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Đánh giá và phản hồi</h1>

            <form>
                <div class="mb-3">
                    <label for="rating" class="form-label">Đánh giá:</label>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="feedback" class="form-label">Feedback</label>
                    <textarea class="form-control" id="feedback" rows="5"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>

            <div class="comments">
                <h2>Các đánh giá khác:</h2>
                <div class="comment">
                    <div class="comment-avatar">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9jyeynlFwVGBRreQHauSuqrkhoKGk7ytIw8OpgZbNA&s" alt="Avatar">
                    </div>
                    <div class="comment-content">
                        <div class="comment-name">Người dùng 1</div>
                        <div class="comment-rating">
                            <span class="badge bg-primary">4 sao</span>
                        </div>
                        <p class="comment-text">Dịch vụ rất tốt, tôi rất hài lòng.</p>
                    </div>
                </div>
                <div class="comment">
                    <div class="comment-avatar">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9jyeynlFwVGBRreQHauSuqrkhoKGk7ytIw8OpgZbNA&s" alt="Avatar">
                    </div>
                    <div class="comment-content">
                        <div class="comment-name">Người dùng 2</div>
                        <div class="comment-rating">
                            <span class="badge bg-primary">5 sao</span>
                        </div>
                        <p class="comment-text">Dịch vụ chất lượng, nhân viên thân thiện.</p>
                    </div>
                </div>
            </div>
        </div>               
        <a href="faq.jsp"><input type="button" id="fb" name="fb" value="Back"></a>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

