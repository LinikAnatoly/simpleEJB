
unit EditRQDDSCodesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQDDSCodesController ;

type
  TfrmRQDDSCodesFilterEdit = class(TDialogForm)

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
  frmRQDDSCodesFilterEdit: TfrmRQDDSCodesFilterEdit;
  RQDDSCodesFilterObj: RQDDSCodesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQDDSCodesController  ;
}
{$R *.dfm}



procedure TfrmRQDDSCodesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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

}

end;



procedure TfrmRQDDSCodesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQDDSCodesFilterObj.name := edtName.Text; 



     RQDDSCodesFilterObj.commentGen := edtCommentGen.Text; 



     RQDDSCodesFilterObj.txtCode := edtTxtCode.Text; 



     if ( edtIsInvest.Text <> '' ) then
       RQDDSCodesFilterObj.isInvest := StrToInt(edtIsInvest.Text)
     else
       RQDDSCodesFilterObj.isInvest := Low(Integer) ;




     if ( edtIsActual.Text <> '' ) then
       RQDDSCodesFilterObj.isActual := StrToInt(edtIsActual.Text)
     else
       RQDDSCodesFilterObj.isActual := Low(Integer) ;





  end;
end;




end.