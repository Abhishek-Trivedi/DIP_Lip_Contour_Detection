# DIP_Lip_Contour_Detection
A project to implement efficient lip contour detection.

### Project id:  38

### Project Tiltle: MULTI-THRESHOLD LIP CONTOUR DETECTION

### Github Link: https://github.com/Abhishek-Trivedi/DIP_Lip_Contour_Detection
                
### Team Members: Abhishek Trivedi     Prajwal Shingala

### Main goal of the project : An effiecient implementation of algorithm for extraction of lip contour from high-resolution static images through Multi-Threshold method. 

### Problem Definition: Automatic Lip Contour has became an essential issue in face image analysis. Many problems like human-machine interaction, emotional analysis, person Identification etc require a fully automated lip contour detection technique. Moreover the presence or absence of teeth, beard or the low contrast between lip and skin requires an efficient and robust approach to solve the problem.

### Proposed Solution: We first will detect the two ends of lips. After that we will divide the lips in upper and lower lip and solve for each lip separately (contour extraction) . For this, we will transform RGB to YIQ and then use segmentation and multi-thresholding. We will use threshold derived from the algo for segmentation and lip contouring.

### Results: Accurate lip contour extraction revealing shape detials of the lip boundaries.

### Milestones:
1) Converting RGB to YIQ : 3 Oct
2) Dividing lips into upper and lower part : 10 Oct
3) Segmentation and Thresholding : 15 OCt
4) Active Contouring : 27 Oct
5) Boundary Detection of lips : 2 Nov
6) Final testing on data : 7 Nov

### Tasks by each :
We will give combine effort for the whole algorithm.

### How To Run :
1) Algorithm Implementation(Lip contour)
    * mention the input lip image in main.m 
2) Novelty Feature(face to lip contour)
    * mention the face image in FaceToLip.m
    * Output of FaceToLip.m to be given as input in main.m
