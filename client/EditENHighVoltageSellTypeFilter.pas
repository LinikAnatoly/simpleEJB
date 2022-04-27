
unit EditENHighVoltageSellTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHighVoltageSellTypeController ;

type
  TfrmENHighVoltageSellTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENHighVoltageSellType: THTTPRIO;

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
  frmENHighVoltageSellTypeFilterEdit: TfrmENHighVoltageSellTypeFilterEdit;
  ENHighVoltageSellTypeFilterObj: ENHighVoltageSellTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHighVoltageSellTypeController  ;
}
{$R *.dfm}



procedure TfrmENHighVoltageSellTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENHighVoltageSellTypeObj.name; 


  end;

}

end;



procedure TfrmENHighVoltageSellTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHighVoltageSellTypeFilterObj.name := edtName.Text; 




  end;
end;




end.