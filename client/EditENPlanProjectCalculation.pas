
unit EditENPlanProjectCalculation;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanProjectCalculationController ;

type
  TfrmENPlanProjectCalculationEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;

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
  frmENPlanProjectCalculationEdit: TfrmENPlanProjectCalculationEdit;
  ENPlanProjectCalculationObj: ENPlanProjectCalculation;

implementation

uses
  ShowTKProjectWorkCalculation
  ,TKProjectWorkCalculationController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanProjectCalculationController  ;
}
{$R *.dfm}



procedure TfrmENPlanProjectCalculationEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKProjectWorkCalculationTkProjWorkCalculationName
      ,spbTKProjectWorkCalculationTkProjWorkCalculation
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPlanProjectCalculationObj.code);

    edtTKProjectWorkCalculationTkProjWorkCalculationName.Text := ENPlanProjectCalculationObj.tkProjWorkCalculation.name;

  end;
end;



procedure TfrmENPlanProjectCalculationEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENPlanProjectCalculationObj.code:=low(Integer);
      TempENPlanProjectCalculation.add(ENPlanProjectCalculationObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanProjectCalculation.save(ENPlanProjectCalculationObj);
    end;
  end;
end;


procedure TfrmENPlanProjectCalculationEdit.spbTKProjectWorkCalculationTkProjWorkCalculationClick(Sender : TObject);
var 
   frmTKProjectWorkCalculationShow: TfrmTKProjectWorkCalculationShow;
begin
   frmTKProjectWorkCalculationShow:=TfrmTKProjectWorkCalculationShow.Create(Application,fmNormal);
   try
      with frmTKProjectWorkCalculationShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanProjectCalculationObj.tkProjWorkCalculation = nil then ENPlanProjectCalculationObj.tkProjWorkCalculation := TKProjectWorkCalculation.Create();
               ENPlanProjectCalculationObj.tkProjWorkCalculation.code := StrToInt(GetReturnValue(sgTKProjectWorkCalculation,0));
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