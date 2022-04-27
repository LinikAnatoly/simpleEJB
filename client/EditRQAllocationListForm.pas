
unit EditRQAllocationListForm;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListFormController ;

type
  TfrmRQAllocationListFormEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQAllocationListForm: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQAllocationListFormEdit: TfrmRQAllocationListFormEdit;
  RQAllocationListFormObj: RQAllocationListForm;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListFormController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListFormEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQAllocationListFormObj.code);
    edtName.Text := RQAllocationListFormObj.name; 


  end;
end;



procedure TfrmRQAllocationListFormEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;


     RQAllocationListFormObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQAllocationListFormObj.code:=low(Integer);
      TempRQAllocationListForm.add(RQAllocationListFormObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQAllocationListForm.save(RQAllocationListFormObj);
    end;
  end;
end;


end.