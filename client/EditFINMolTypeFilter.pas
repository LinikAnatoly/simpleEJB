
unit EditFINMolTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolTypeController ;

type
  TfrmFINMolTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINMolType: THTTPRIO;

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
  frmFINMolTypeFilterEdit: TfrmFINMolTypeFilterEdit;
  FINMolTypeFilterObj: FINMolTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMolTypeController  ;
}
{$R *.dfm}



procedure TfrmFINMolTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := FINMolTypeObj.name; 


  end;

}

end;



procedure TfrmFINMolTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMolType: FINMolTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINMolTypeFilterObj.name := edtName.Text; 




  end;
end;




end.