
unit EditENDestinationOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationOrderController ;

type
  TfrmENDestinationOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberInOrder : TLabel;
    edtNumberInOrder: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


  HTTPRIOENDestinationOrder: THTTPRIO;

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
  frmENDestinationOrderEdit: TfrmENDestinationOrderEdit;
  ENDestinationOrderObj: ENDestinationOrder;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDestinationOrderController  ;
}
{$R *.dfm}



procedure TfrmENDestinationOrderEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberInOrder
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENDestinationOrderObj.code);
    if ( ENDestinationOrderObj.numberInOrder <> Low(Integer) ) then
       edtNumberInOrder.Text := IntToStr(ENDestinationOrderObj.numberInOrder)
    else
       edtNumberInOrder.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENDestinationOrderObj.commentGen);


  end;
end;



procedure TfrmENDestinationOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberInOrder
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDestinationOrder := HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;


     if ( edtNumberInOrder.Text <> '' ) then
       ENDestinationOrderObj.numberInOrder := StrToInt(edtNumberInOrder.Text)
     else
       ENDestinationOrderObj.numberInOrder := Low(Integer) ;

     ENDestinationOrderObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENDestinationOrderObj.code:=low(Integer);
      TempENDestinationOrder.add(ENDestinationOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDestinationOrder.save(ENDestinationOrderObj);
    end;
  end;
end;


end.