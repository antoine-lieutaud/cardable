const redirectAfterIntro = () => {
  const video = document.querySelector("#intro");
  video.onended = function () {
    window.location.replace("/home");
  };
}

export { redirectAfterIntro };
