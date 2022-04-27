
unit EditFINDoc2FKOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDoc2FKOrderController ;

type
  TfrmFINDoc2FKOrderFilterEdit = class(TDialogForm)

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

    lblFinDocCodeContract : TLabel;
    edtFinDocCodeContract: TEdit;



  HTTPRIOFINDoc2FKOrder: THTTPRIO;

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
  frmFINDoc2FKOrderFilterEdit: TfrmFINDoc2FKOrderFilterEdit;
  FINDoc2FKOrderFilterObj: FINDoc2FKOrderFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINDoc2FKOrderController  ;
}
{$R *.dfm}



procedure TfrmFINDoc2FKOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( FINDoc2FKOrderObj.finDocCode <> Low(Integer) ) then
       edtFinDocCode.Text := IntToStr(FINDoc2FKOrderObj.finDocCode)
    else
       edtFinDocCode.Text := '';



    if ( FINDoc2FKOrderObj.finDocCodeContract <> Low(Integer) ) then
       edtFinDocCodeContract.Text := IntToStr(FINDoc2FKOrderObj.finDocCodeContract)
    else
       edtFinDocCodeContract.Text := '';


  end;

}

end;



procedure TfrmFINDoc2FKOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtFinDocCode.Text <> '' ) then
       FINDoc2FKOrderFilterObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       FINDoc2FKOrderFilterObj.finDocCode := Low(Integer) ;




     if ( edtFinDocCodeContract.Text <> '' ) then
       FINDoc2FKOrderFilterObj.finDocCodeContract := StrToInt(edtFinDocCodeContract.Text)
     else
       FINDoc2FKOrderFilterObj.finDocCodeContract := Low(Integer) ;





  end;
end;




end.