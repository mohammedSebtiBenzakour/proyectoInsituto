let cardCount, animationDuration, animationPosition, selectedPosition;
var keyframeDisplayDetails;

window.onload = () => {
     try {
          /*****  Set card Top / Bottom div background styles  *****/
          setCardBackgrounds();

          /*****  Set Global variables  *****/
          const carouselContainer = document.querySelector(".cc-carousel-container");
          cardCount = carouselContainer.querySelectorAll(".cc-card").length;
          animationDuration = parseInt(carouselContainer.dataset.animationDuration);
          animationPosition = carouselContainer.dataset.animationPosition;

          keyframeDisplayDetails = [
               { opacity: 0, transform: "translateY(0px)" },
               { opacity: 1, transform: "translateY(175px)" },
          ];

          document.querySelectorAll(".cc-card").forEach(function (card) {
               card.addEventListener("click", handleClickEvent);
               var cardBottom = card.querySelector(".cc-card-bottom");
               var animatedDisplayDetails = cardBottom.animate(keyframeDisplayDetails, { duration: 100, iterations: 1, fill: "forwards" });
               animatedDisplayDetails.persist();
               card.dataset.cardPosition == 1 ? animatedDisplayDetails.play() : animatedDisplayDetails.pause();
          });
     } catch (err) {
          console.log("Winow.onload Error:" + err.message);
     }
};

function handleClickEvent(ccCard) {
     try {
          var card = ccCard.currentTarget;
          selectedPosition = parseInt(card.dataset.cardPosition);

          if (selectedPosition == 1) {
               return;
          }

          positionIncrements = getAnimatiopositionIncrement(selectedPosition);
          animateCarousel(positionIncrements);
     } catch (err) {
          console.log("handleClickEvent Error:" + err.message);
     }
}

/*****  Apply Animations to Carousel and cards  *****/
function animateCarousel(positionIncrements) {
     try {
          let AnimationStartStop = getAnimationStartStop(positionIncrements);

          let carouselStart = "rotate(" + AnimationStartStop[0] + "deg)";
          let carouselEnd = "rotate(" + AnimationStartStop[1] + "deg)";
          let cardStart = "rotate(" + AnimationStartStop[2] + "deg)";
          let cardEnd = "rotate(" + AnimationStartStop[3] + "deg)";

          /*****  Hide Current displayed "cc-card-botton" element *****/
          var hideDetailsAnimation = document
               .querySelector('.cc-card[data-card-position="1"]')
               .querySelector(".cc-card-bottom")
               .animate(keyframeDisplayDetails, { duration: 400, iterations: 1, easing: "ease-out", fill: "both" });
          hideDetailsAnimation.updatePlaybackRate(-1);
          hideDetailsAnimation.play();

          var keyframeRotateCarousel = [{ transform: carouselStart }, { transform: carouselEnd }];
          var carouselContainer = document.querySelector(".cc-carousel-container");
          var containerAnimation = carouselContainer.animate(keyframeRotateCarousel, { duration: animationDuration, iterations: 1, easing: "linear", fill: "both" });
          containerAnimation.pause();

          document
               .querySelector('.cc-card[data-card-position="' + selectedPosition + '"]')
               .querySelector(".cc-card-bottom")
               .animate(keyframeDisplayDetails, { duration: 500, iterations: 1, fill: "both", delay: animationDuration })
               .updatePlaybackRate(1);

          var keyframeRotateCard = [{ transform: cardStart }, { transform: cardEnd }];

          document.querySelectorAll(".cc-card").forEach(function (card) {
               let cardAnimation = card.animate(keyframeRotateCard, { duration: animationDuration, iterations: 1, easing: "linear", fill: "both" });
               cardAnimation.commitStyles();
          });

          containerAnimation.play();
          containerAnimation.commitStyles();

          setAnimationPositions(selectedPosition, positionIncrements, AnimationStartStop);

          void carouselContainer.offsetWidth;
     } catch (err) {
          console.log("animateCarousel Error: " + err.message);
     }
}

/*****  Calculater number of "postions" to move non-clicked cards  *****/
function getAnimatiopositionIncrement(cardPosition) {
     try {
          return cardPosition >= Math.round((cardCount + 1) / 2) ? cardCount + 1 - cardPosition : 1 - cardPosition;
     } catch (err) {
          console.log("getAnimatiopositionIncrement Error: " + err.message);
     }
}

/*****  Calulate carousel / card tranform: Rotate(###deg) Values  *****/
function getAnimationStartStop(positionIncrement) {
     try {
          let startDegrees, endDegrees;
          let rotationArc = 360 / cardCount;

          startDegrees = positionIncrement < 0 ? animationPosition : Math.abs(animationPosition);
          endDegrees = positionIncrement < 0 ? Math.abs(rotationArc * positionIncrement) : rotationArc * positionIncrement;

          endCardDegrees = endDegrees >= 0 ? endDegrees * -1 : Math.abs(endDegrees);

          return [startDegrees, endDegrees, startDegrees, endCardDegrees];
     } catch (err) {
          console.log("getAnimationStartStop Error: " + err.message);
          return [0, 360 / cardCount];
     }
}

/*****  Format Background Image Size To A Valid CSS Value  *****/
function getBackgroundImageSize(size) {
     try {
          let sz = size.toLowerCase();
          if (sz == "c" || sz == "cover") {
               return "cover";
          } else if (sz == "co" || sz == "contain") {
               return "contain";
          } else if (sz == "a" || sz == "auto") {
               return "auto";
          } else if (sz.includes("%") || sz.includes(",") || sz.includes("px")) {
               return sz;
          } else {
               return "cover";
          }
     } catch (err) {
          console.log("getBackgroundImageSize: " + err.message);
          return "cover";
     }
}
/*****  Update carousel / card data-*-position attributes  *****/
function setAnimationPositions(cardPosition, positionIncrements, AnimationStartStop) {
     try {
          /*****  Determine new 180 Degree animation position  *****/
          let animationNewPosition = 0;
          if (positionIncrements <= 0) {
               if (Math.abs(AnimationStartStop[0]) == -180) {
                    carouselNewPosition = 0;
               } else {
                    animationNewPosition = AnimationStartStop[0];
               }
          } else {
               animationNewPosition = AnimationStartStop[1];
          }

          var carouselContainer = document.querySelector(".cc-carousel-container");
          void carouselContainer.offsetWidth;
          carouselContainer.dataset.animationPosition = animationNewPosition;

          document.querySelectorAll(".cc-card").forEach(function (card) {
               let newPosition = getNewAnimationPosition(card, cardPosition, positionIncrements);
               card.dataset.cardPosition = newPosition;
          });
     } catch (e) {
          console.log("setAnimationPositions Error: " + e.message);
     }
}

/*****  Calculate Carousel / Card Animation Positon Adjustment  *****/
function getNewAnimationPosition(card, cardPosition, positionIncrements) {
     try {
          let newPosition;
          let currentPosition = parseInt(card.dataset.cardPosition);

          newPosition = currentPosition == cardPosition ? 1 : parseInt(currentPosition) + positionIncrements;

          if (newPosition > cardCount) {
               newPosition = newPosition - cardCount;
          } else if (newPosition == 0) {
               newPosition = currentPosition < Math.round((cardCount + 1) / 2) ? 6 : 1;
          } else if (newPosition < 0) {
               newPosition = positionIncrements < 0 ? cardCount + 1 + positionIncrements : cardCount + newPosition + 1;
          }
          return newPosition;
     } catch (err) {
          console.log("getNewAnimationPosition Error: " + err.message);
     }
}

/*****  Add background images to cards  *****/
function setCardBackgrounds() {
     try {
          document.querySelectorAll(".cc-card").forEach(function (card) {
               let cardTop = card.querySelector(".cc-card-top");
               let cardBottom = card.querySelector(".cc-card-bottom");
               let bgColor = "#" + card.dataset.backgroundColor;

               cardTop.style.background = "url(" + card.dataset.imageSrc + ") no-repeat";
               cardTop.style.backgroundSize = getBackgroundImageSize(card.dataset.imageSize);
               cardTop.style.backgroundPosition = card.dataset.backgroundPosition.toLowerCase();
               cardTop.style.backgroundColor = bgColor;

               cardBottom.style.backgroundColor = bgColor;
          });
     } catch (err) {
          console.log("setCardBackgrounds Error: " + err.message);
     }
}