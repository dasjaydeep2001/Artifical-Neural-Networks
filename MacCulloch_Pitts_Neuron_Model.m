function NN= neural(Name,EX1,EX2,Th,w1,w2)
NN.x1=EX1;
NN.x2=EX2;
NN.theta=Th;
NN.Name=Name;
y=[0 0 0 0];
switch NN.Name
    case 'MyAND'
        z=[0 0 0 1];
    case 'MyANDNOT'
        z=[0 0 1 0];
        case 'MyOR'
        z=[0 1 1 1];     
 end
con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
      if zin(i)>=theta
          y(i)=1;
      else
          y(i)=0;
      end
  end
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      	  w1=input('weight w1=');
      	  w2=input('weight w2=');
      	  theta=input('theta=');
  end
end
disp('Mcculloch-Pitts Net for  function');
disp('Weights of Neuron');
disp(w1);
disp(w2);
disp('Threshold value');
disp(theta);