
unit EditRQAllocationListStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListStatusController ;

type
  TfrmRQAllocationListStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQAllocationListStatus: THTTPRIO;

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
  frmRQAllocationListStatusEdit: TfrmRQAllocationListStatusEdit;
  RQAllocationListStatusObj: RQAllocationListStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListStatusController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQAllocationListStatusObj.code);
    edtName.Text := RQAllocationListStatusObj.name; 


  end;
end;



procedure TfrmRQAllocationListStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
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
    TempRQAllocationListStatus := HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;


     RQAllocationListStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQAllocationListStatusObj.code:=low(Integer);
      TempRQAllocationListStatus.add(RQAllocationListStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQAllocationListStatus.save(RQAllocationListStatusObj);
    end;
  end;
end;


end.