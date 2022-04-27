
unit EditRQCentralExportGraphType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphTypeController ;

type
  TfrmRQCentralExportGraphTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;


  HTTPRIORQCentralExportGraphType: THTTPRIO;

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
  frmRQCentralExportGraphTypeEdit: TfrmRQCentralExportGraphTypeEdit;
  RQCentralExportGraphTypeObj: RQCentralExportGraphType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphTypeController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQCentralExportGraphTypeObj.code);
    MakeMultiline(edtName.Lines, RQCentralExportGraphTypeObj.name);


  end;
end;



procedure TfrmRQCentralExportGraphTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;
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
    TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;


     RQCentralExportGraphTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQCentralExportGraphTypeObj.code:=low(Integer);
      TempRQCentralExportGraphType.add(RQCentralExportGraphTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQCentralExportGraphType.save(RQCentralExportGraphTypeObj);
    end;
  end;
end;


end.