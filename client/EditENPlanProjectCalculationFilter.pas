
unit EditENPlanProjectCalculationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanProjectCalculationController ;

type
  TfrmENPlanProjectCalculationFilterEdit = class(TDialogForm)


  lblTKProjectWorkCalculationTkProjWorkCalculationName : TLabel;
  edtTKProjectWorkCalculationTkProjWorkCalculationName : TEdit;
  spbTKProjectWorkCalculationTkProjWorkCalculation : TSpeedButton;
  

  HTTPRIOENPlanProjectCalculation: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKProjectWorkCalculationTkProjWorkCalculationClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanProjectCalculationFilterEdit: TfrmENPlanProjectCalculationFilterEdit;
  ENPlanProjectCalculationFilterObj: ENPlanProjectCalculationFilter;

implementation

uses
  ShowTKProjectWorkCalculation
  ,TKProjectWorkCalculationController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanProjectCalculationController  ;
}
{$R *.dfm}



procedure TfrmENPlanProjectCalculationFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENPlanProjectCalculationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENPlanProjectCalculationFilterEdit.spbTKProjectWorkCalculationTkProjWorkCalculationClick(Sender : TObject);
var 
   frmTKProjectWorkCalculationShow: TfrmTKProjectWorkCalculationShow;
begin
   frmTKProjectWorkCalculationShow:=TfrmTKProjectWorkCalculationShow.Create(Application,fmNormal);
   try
      with frmTKProjectWorkCalculationShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanProjectCalculationFilterObj.tkProjWorkCalculation = nil then ENPlanProjectCalculationFilterObj.tkProjWorkCalculation := TKProjectWorkCalculation.Create();
               ENPlanProjectCalculationFilterObj.tkProjWorkCalculation.code := StrToInt(GetReturnValue(sgTKProjectWorkCalculation,0));
               edtTKProjectWorkCalculationTkProjWorkCalculationName.Text:=GetReturnValue(sgTKProjectWorkCalculation,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKProjectWorkCalculationShow.Free;
   end;
end;





end.