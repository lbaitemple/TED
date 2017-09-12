
package model;
public class TEMainControl extends TEProb
{
	public TEMainControl();
	
	public TEMainControl(boolean r);
		r==true:    Initiate and run normal model
				    data = new double[54][1000];init();runModel(1);
		r==false:   Initiate single-step model
	public TEMainControl(int f, double ft, double tt);
	public TEMainControl(int f, double ft, double tt, int adj, int dnoise);
		f      fault ID
		ft     fault time: in hour
		tt     total time: in hour
		adj    adjust: 1 1 sec/sim; 2 0.5sec/sim; ...
		dnoise noise?  1 yes; 0 no
	public double [][] getData();
		Get the data : data[][]
	public void setFault(int f);
		Set one fault, single step mode only
	public void removeFault(int f);
		Remove one fault, single step mode only
	public void removeAllFaults();
		Remove all faults, single step mode only
	public double [] runGetData();
	public void init();
		Initiate the process
	public void runModel(int flg);
		Run the model. flag control whether saving the result to data[][]
	public void main(String[] args);
		Test the class
}