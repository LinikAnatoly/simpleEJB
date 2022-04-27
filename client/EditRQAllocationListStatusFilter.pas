
unit EditRQAllocationListStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListStatusController ;

type
  TfrmRQAllocationListStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQAllocationListStatus: THTTPRIO;

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
  frmRQAllocationListStatusFilterEdit: TfrmRQAllocationListStatusFilterEdit;
  RQAllocationListStatusFilterObj: RQAllocationListStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListStatusController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQAllocationListStatusObj.name; 


  end;

}

end;



procedure TfrmRQAllocationListStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQAllocationListStatusFilterObj.name := edtName.Text; 




  end;
end;




end.