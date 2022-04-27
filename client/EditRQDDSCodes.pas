
unit EditRQDDSCodes;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQDDSCodesController ;

type
  TfrmRQDDSCodesEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblTxtCode : TLabel;
    edtTxtCode: TEdit;
    lblIsInvest : TLabel;
    edtIsInvest: TEdit;
    lblIsActual : TLabel;
    edtIsActual: TEdit;


  HTTPRIORQDDSCodes: THTTPRIO;

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
  frmRQDDSCodesEdit: TfrmRQDDSCodesEdit;
  RQDDSCodesObj: RQDDSCodes;

implementation


{uses  
    EnergyproController, EnergyproController2, RQDDSCodesController  ;
}
{$R *.dfm}



procedure TfrmRQDDSCodesEdit.FormShow(Sender: TObject);

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
    edtName.Text := RQDDSCodesObj.name; 
    edtCommentGen.Text := RQDDSCodesObj.commentGen; 
    edtTxtCode.Text := RQDDSCodesObj.txtCode; 
    if ( RQDDSCodesObj.isInvest <> Low(Integer) ) then
       edtIsInvest.Text := IntToStr(RQDDSCodesObj.isInvest)
    else
       edtIsInvest.Text := '';
    if ( RQDDSCodesObj.isActual <> Low(Integer) ) then
       edtIsActual.Text := IntToStr(RQDDSCodesObj.isActual)
    else
       edtIsActual.Text := '';


  end;
end;



procedure TfrmRQDDSCodesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
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
    TempRQDDSCodes := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;


     RQDDSCodesObj.name := edtName.Text; 

     RQDDSCodesObj.commentGen := edtCommentGen.Text; 

     RQDDSCodesObj.txtCode := edtTxtCode.Text; 

     if ( edtIsInvest.Text <> '' ) then
       RQDDSCodesObj.isInvest := StrToInt(edtIsInvest.Text)
     else
       RQDDSCodesObj.isInvest := Low(Integer) ;

     if ( edtIsActual.Text <> '' ) then
       RQDDSCodesObj.isActual := StrToInt(edtIsActual.Text)
     else
       RQDDSCodesObj.isActual := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      RQDDSCodesObj.code:=low(Integer);
      TempRQDDSCodes.add(RQDDSCodesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQDDSCodes.save(RQDDSCodesObj);
    end;
  end;
end;


end.