# BrainWhiteMatterWorkspace
MATLAB GUI Workspace for brain white matter

#### 使用方法

1. 首先将待处理的数据依下图所示存入文件夹内，不同类型数据分别存 入data_FunImg_T1Img 文件夹下FunImg、T1Img 两个子文件夹中。下图中其余文件夹分别存储了其他需要的程序、过程中将产生的数据、计算结果数据等内容。

   <img src="assets\image-20241024112401532.png" alt="image-20241024112401532" style="zoom:50%;" />

2. 运行paramter_check.m 文件，会有如下图形界面。

   <img src="assets\image-20241024112510490.png" alt="image-20241024112510490" style="zoom:50%;" />

   选择当前系统并点 击Paramter Check 按键，会计算并显示上述文件夹内数据的参数，显示本批次共 有多少组数据可以一起计算；如有参数不同的数据不能本批次处理，会自动生 成一个tmp文件夹存储这些数据。

3.  点击 Paramter Check 后会弹出参数调整界面，默认值如下图所示。 订正参数后点击RUN！即可运行，并会弹出“ 开始处理”的提示。计算结果会存入各result 文件夹中。

   ![](G:\files\projectFiles\BrainWhiteMatterWorkspace\assets\image-20241024112528765.png)
