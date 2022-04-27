
unit EditRQOrderTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderTypeController ;

type
  TfrmRQOrderTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderType: THTTPRIO;

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
  frmRQOrderTypeFilterEdit: TfrmRQOrderTypeFilterEdit;
  RQOrderTypeFilterObj: RQOrderTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderTypeController  ;
}
{$R *.dfm}



procedure TfrmRQOrderTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderTypeObj.name; 


  end;

}

end;



procedure TfrmRQOrderTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderType: RQOrderTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderTypeFilterObj.name := edtName.Text; 




  end;
end;




end.