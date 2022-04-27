
unit EditENCabelOutType10Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelOutType10Controller ;

type
  TfrmENCabelOutType10FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENCabelOutType10: THTTPRIO;

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
  frmENCabelOutType10FilterEdit: TfrmENCabelOutType10FilterEdit;
  ENCabelOutType10FilterObj: ENCabelOutType10Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCabelOutType10Controller  ;
}
{$R *.dfm}



procedure TfrmENCabelOutType10FilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCabelOutType10Obj.name; 


  end;

}

end;



procedure TfrmENCabelOutType10FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCabelOutType10FilterObj.name := edtName.Text; 




  end;
end;




end.