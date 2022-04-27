
unit EditRQOrderItemTypePayFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItemTypePayController ;

type
  TfrmRQOrderItemTypePayFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQOrderItemTypePay: THTTPRIO;

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
  frmRQOrderItemTypePayFilterEdit: TfrmRQOrderItemTypePayFilterEdit;
  RQOrderItemTypePayFilterObj: RQOrderItemTypePayFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderItemTypePayController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItemTypePayFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderItemTypePayObj.name; 


  end;

}

end;



procedure TfrmRQOrderItemTypePayFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderItemTypePayFilterObj.name := edtName.Text; 




  end;
end;




end.
