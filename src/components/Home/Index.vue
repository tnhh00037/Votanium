
<template>
    <div>
        <div class=' introduction center'>
            <h1>BLOCKCHAIN VOTING SYSTEM</h1>  
            <br>
            <p>Creating a whole new way for the Election</p>
            <p>Transparent result</p>
        </div>
        
        <br>
        <div class="candidate center">
            <h3 >Candidates </h3>
            <div class='row mt-2'>
                <div class="col md-6 col-xs-12">
                    <div class="card">
                        <div class="card-body">
                            <img src="https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/25/11/Trump-UN-laugh.jpg" alt="" >
                        </div>
                        <div class="card-footer">
                            <p>Republican Party</p>
                            <button class="button btn btn-info">Vote</button>
                        </div>
                    </div>
                </div> 
                <div class="col md-6 col-xs-12">
                    <div class="card">
                        <div class="card-body">
                            <img src="https://pbs.twimg.com/profile_images/839938827837976576/leN1zJJx_400x400.jpg" alt="">
                        </div>
                        <div class="card-footer">
                            <p>Democratic Party</p>
                            <button class="button btn btn-info">Vote</button>
                        </div>
                    </div>
                </div>                   
            </div>
            
        </div>
         <h3 class='mt-4 center'>Presidential Election Results</h3>           
        <div class="result center container" style='background:white;'>
            <div class="pt-4">
                <div class="big-number">
                    <div class="left-text">
                        <span class="vote">306</span>
                        <span class="name">Trump</span>                   
                    </div>
                    <div class="right-text">
                        <span class="name">232</span>
                        <span class="vote">Clinton</span>
                    </div>
                </div>
                <div class="progress-bar" style='background:transparent'>
                    <div class="candidate-icon">
                        <img src="@/assets/images/trump-icon.jpg" alt="" >
                        <img src="@/assets/images/clinton-icon.jpg" alt="">
                    </div>
                    <div class="small-bar">
                        <div class="bar-left" style='width:60%;background:#ff5252'> </div>
                        <div class="bar-right" style='width:40%;background:#2196f3'> </div>
                        <div class="horizone-line"></div>
                    </div>
                    <div class="amount">
                        <div class="trump-vote">
                            <p> <b>xx Votes </b> ( xx %)   </p>
                        </div>
                        <div class="middle-text">50%</div>
                        <div class="hil-vote">
                            <p> <b>xx Votes </b> ( xx %)   </p>
                        </div>
                    </div>
                    <div class="mt-2">
                        <img src="@/assets/images/election.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
    </div>
</template>
<style>

.mg-auto{
    margin:0 auto;
}

.center{
    text-align:center;
}
.trans{
    background:transparent !important;
}
.introduction {
    widows: 100%;
    height:360px;
    background:#17529E url(https://wallpapercave.com/wp/wp2337006.jpg) no-repeat center fixed;
    padding-top:100px;
    background-size:cover;
    color:white;
}
.introduction h1{
    color:yellow;
}
.candidate{
    margin-top:20px;
}
.candidate img {
    display:inline-block;
    margin-top:40px;
    height:200px;
}
.candidate button {
    width:100px;
}
.result{
    height:300px;
    /* background:rgb(145, 193, 230) */
}
.big-number{
    margin:0 5.5em;
    display: flex;
    justify-content: space-between;
}
.left-text{
    color:#ff5252
}
.right-text{
    color:#2196f3;
}

/* .left-text{
    
}
.right-text{
    
} */
.name{
    font-size: 18px;
    font-weight:700;
}
.vote{
    font-size: 30px;
    font-weight:800;
}
.candidate-icon{
    display: flex;
    justify-content: space-between;
    height: 70px;
    margin-top:-50px;
}
.candidate-icon img{
    height:70px;
    border-radius:50%;
    border:3px solid rgb(244, 245, 250);
    z-index: 999;
}
.small-bar{
    margin: -25px 30px;height: 20px;background: gray;display: flex;;
}
.horizone-line{
    width: 2px;
    height: 20px;
    background: #f4f5fa;
    position: absolute;
    margin-left: 50%;
}
/* .middle-text{
    position: absolute;
    margin-left: 49%;
    margin-top: 20px;
    color: darkgray !important;
} */
.amount{display:flex;justify-content:space-between;color:darkgray;margin-top:2rem}
.middle-text{
    margin-left:13%;
}
</style>

<script>
export default {
    name:'Index',

}
</script>

