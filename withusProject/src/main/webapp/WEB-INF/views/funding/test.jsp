<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
             <!-- jQuery 라이브러리 -->
             <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <!-- include summernote css/js -->
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
            <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
        </head>

        <body>
            
            <div class="summernote">
                <textarea name="summernote" id="summernote"></textarea>
            </div>

            <script>
                // 썸머노트
                $(document).ready(function() {
        
                    $('#summernote').summernote({
                        height: 310,                    // 에디터 높이
                        minHeight: null,                // 최소 높이
                        maxHeight: null,                // 최대 높이
                        focus: true,                    // 에디터 로딩후 포커스를 맞출지 여부
                        lang: "ko-KR",                  // 한글 설정
                        resize: none,
                        toolbar: []                
                    });
        
                    $('#summernote').summernote('disable');
                });
        
            </script>


        </body>

        </html>