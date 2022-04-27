
unit EditCNSubsystemTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, CNSubsystemTypeController ;

type
  TfrmCNSubsystemTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOCNSubsystemType: THTTPRIO;

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
  frmCNSubsystemTypeFilterEdit: TfrmCNSubsystemTypeFilterEdit;
  CNSubsystemTypeFilterObj: CNSubsystemTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, CNSubsystemTypeController  ;
}
{$R *.dfm}



procedure TfrmCNSubsystemTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := CNSubsystemTypeObj.name; 


  end;

}

end;



procedure TfrmCNSubsystemTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempCNSubsystemType: CNSubsystemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     CNSubsystemTypeFilterObj.name := edtName.Text; 




  end;
end;




end.