unit ListENPlanProjectCalculation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, TKProjectWorkCalculationController, Buttons , ChildFormUnit ;

type
  TFrmENPlanProjectCalculationList = class(TDialogForm)
    ListTKProjectCalculation: TCheckListBox;
    HTTPRIOTKProjectWorkCalculation: THTTPRIO;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  plancode : Integer;
    { Public declarations }
  end;

var
  FrmENPlanProjectCalculationList: TFrmENPlanProjectCalculationList;

implementation

{$R *.dfm}

procedure TFrmENPlanProjectCalculationList.FormShow(Sender: TObject);
var
 TempTKProjectWorkCalculation: TKProjectWorkCalculationControllerSoapPort;
 i , LastCount , li: Integer;
 TKProjectWorkCalculationList: TKProjectWorkCalculationShortList;
 tempTKProjectWorkCalculationFilter : TKProjectWorkCalculationFilter;
begin


  TempTKProjectWorkCalculation :=  HTTPRIOTKProjectWorkCalculation as TKProjectWorkCalculationControllerSoapPort;


     tempTKProjectWorkCalculationFilter := TKProjectWorkCalculationFilter.Create;
     SetNullIntProps(tempTKProjectWorkCalculationFilter);
     SetNullXSProps(tempTKProjectWorkCalculationFilter);

     tempTKProjectWorkCalculationFilter.conditionSQL :=
     ' tkprojectworkcalculatn.code not in ( select pcl.tkprojworkcalculatincd from enplanprojectcalculatn pcl,  enplanproject ppr ' +
     ' where ppr.planrefcode = ' + IntToStr(plancode) +
     ' and pcl.projectworkrefcode = ppr.code )  ' ;

  TKProjectWorkCalculationList := TempTKProjectWorkCalculation.getScrollableFilteredList(tempTKProjectWorkCalculationFilter,0,1000);
  LastCount:=High(TKProjectWorkCalculationList.list);

  ListTKProjectCalculation.Items.Clear;

     for li:=0 to High(TKProjectWorkCalculationList.list) do
      begin

        ListTKProjectCalculation.Items.AddObject(TKProjectWorkCalculationList.list[li].name  , TObject( TKProjectWorkCalculationList.list[li].code )  );
      end;

end;

end.
