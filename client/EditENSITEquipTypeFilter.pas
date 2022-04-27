
unit EditENSITEquipTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipTypeController ;

type
  TfrmENSITEquipTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENSITEquipType: THTTPRIO;

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
  frmENSITEquipTypeFilterEdit: TfrmENSITEquipTypeFilterEdit;
  ENSITEquipTypeFilterObj: ENSITEquipTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITEquipTypeController  ;
}
{$R *.dfm}



procedure TfrmENSITEquipTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDescription
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSITEquipTypeObj.name; 



    edtDescription.Text := ENSITEquipTypeObj.description; 


  end;

}

end;



procedure TfrmENSITEquipTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITEquipTypeFilterObj.name := edtName.Text; 



     ENSITEquipTypeFilterObj.description := edtDescription.Text; 




  end;
end;




end.