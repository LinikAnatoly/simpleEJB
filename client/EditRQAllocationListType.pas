
unit EditRQAllocationListType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListTypeController ;

type
  TfrmRQAllocationListTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQAllocationListType: THTTPRIO;

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
  frmRQAllocationListTypeEdit: TfrmRQAllocationListTypeEdit;
  RQAllocationListTypeObj: RQAllocationListType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListTypeController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQAllocationListTypeObj.code);
    edtName.Text := RQAllocationListTypeObj.name; 


  end;
end;



procedure TfrmRQAllocationListTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
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
    TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;


     RQAllocationListTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQAllocationListTypeObj.code:=low(Integer);
      TempRQAllocationListType.add(RQAllocationListTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQAllocationListType.save(RQAllocationListTypeObj);
    end;
  end;
end;


end.