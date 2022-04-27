
unit EditSpr_matherialFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, Spr_matherialController ;

type
  TfrmSpr_matherialFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOSpr_matherial: THTTPRIO;

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
  frmSpr_matherialFilterEdit: TfrmSpr_matherialFilterEdit;
  Spr_matherialFilterObj: Spr_matherialFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, Spr_matherialController  ;
}
{$R *.dfm}



procedure TfrmSpr_matherialFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := Spr_matherialObj.name; 


  end;

}

end;



procedure TfrmSpr_matherialFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSpr_matherial: Spr_matherialControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     Spr_matherialFilterObj.name := edtName.Text; 




  end;
end;




end.