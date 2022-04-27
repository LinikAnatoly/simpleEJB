
unit EditRQAllocationListTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListTypeController ;

type
  TfrmRQAllocationListTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQAllocationListType: THTTPRIO;

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
  frmRQAllocationListTypeFilterEdit: TfrmRQAllocationListTypeFilterEdit;
  RQAllocationListTypeFilterObj: RQAllocationListTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListTypeController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQAllocationListTypeObj.name; 


  end;

}

end;



procedure TfrmRQAllocationListTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQAllocationListTypeFilterObj.name := edtName.Text; 




  end;
end;




end.