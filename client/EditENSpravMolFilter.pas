
unit EditENSpravMolFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSpravMolController ;

type
  TfrmENSpravMolFilterEdit = class(TDialogForm)

    lblMolkod : TLabel;
    edtMolkod: TEdit;

    lblMolname : TLabel;
    edtMolname: TMemo;


  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  

  HTTPRIOENSpravMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSpravMolFilterEdit: TfrmENSpravMolFilterEdit;
  ENSpravMolFilterObj: ENSpravMolFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, ENSpravMolController  ;
}
{$R *.dfm}



procedure TfrmENSpravMolFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolkod
      ,edtMolname
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMolkod.Text := ENSpravMolObj.molkod; 



    MakeMultiline(edtMolname.Lines, ENSpravMolObj.molname);


  end;

}

end;



procedure TfrmENSpravMolFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSpravMol: ENSpravMolControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSpravMolFilterObj.molkod := edtMolkod.Text; 



     ENSpravMolFilterObj.molname := edtMolname.Text; 




  end;
end;

procedure TfrmENSpravMolFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSpravMolFilterObj.department = nil then ENSpravMolFilterObj.department := ENDepartment.Create();
                ENSpravMolFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
                edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;





end.