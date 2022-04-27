
unit EditRQFKOrder2FKOrderTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrder2FKOrderTypeController ;

type
  TfrmRQFKOrder2FKOrderTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQFKOrder2FKOrderType: THTTPRIO;

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
  frmRQFKOrder2FKOrderTypeFilterEdit: TfrmRQFKOrder2FKOrderTypeFilterEdit;
  RQFKOrder2FKOrderTypeFilterObj: RQFKOrder2FKOrderTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrder2FKOrderTypeController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrder2FKOrderTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQFKOrder2FKOrderTypeObj.name; 


  end;

}

end;



procedure TfrmRQFKOrder2FKOrderTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrder2FKOrderTypeFilterObj.name := edtName.Text; 




  end;
end;




end.