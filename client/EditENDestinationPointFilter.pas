
unit EditENDestinationPointFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationPointController ;

type
  TfrmENDestinationPointFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDestinationPoint: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtENDepartmentName: TEdit;
    lblENDepartmentName: TLabel;
    spbEnDepartmentName: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEnDepartmentNameClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDestinationPointFilterEdit: TfrmENDestinationPointFilterEdit;
  ENDestinationPointFilterObj: ENDestinationPointFilter;

implementation


uses ShowENDepartment
,ENDepartmentController
;
{$R *.dfm}



procedure TfrmENDestinationPointFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtENDepartmentName]);
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtName.Lines, ENDestinationPointObj.name);



    MakeMultiline(edtCommentGen.Lines, ENDestinationPointObj.commentGen);



      if ENDestinationPointObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENDestinationPointObj.dateEdit.Year,ENDestinationPointObj.dateEdit.Month,ENDestinationPointObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := ENDestinationPointObj.userGen; 


  end;

}

end;



procedure TfrmENDestinationPointFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationPoint: ENDestinationPointControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDestinationPointFilterObj.name := edtName.Text;

  end;
end;




procedure TfrmENDestinationPointFilterEdit.spbEnDepartmentNameClick(
  Sender: TObject);
 var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
       DisableActions([ actNoFilter, actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
            try
               if ENDestinationPointFilterObj.departmentRef = nil then ENDestinationPointFilterObj.departmentRef := ENDepartmentRef.Create();
               ENDestinationPointFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;


end.