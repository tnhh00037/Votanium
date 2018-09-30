<template>
    <div>
        <nav class="navbar navbar-expand-lg bg-light">
            <a class="navbar-brand" href="#">VOTANIUM</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                <a class="nav-item nav-link" href="#">Rule</a>
                <a class="nav-item nav-link" href="#">Result</a>
                <a class="nav-item nav-link disabled" href="#">Disabled</a>
                </div>
            </div>
        </nav>
    </div>
</template>
<style>
.navbar{
    background:rgb(12,23,27) !important;
    position:fixed;
}
</style>

<script>
export default {
    name:'HeaderComponent'
}
</script>

