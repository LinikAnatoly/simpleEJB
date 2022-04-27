
unit EditENBuilderObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilderObjectController ;

type
  TfrmENBuilderObjectFilterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblYearBuild : TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart : TLabel;
    edtYearWorkingStart: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

  lblENBuilderObjectTypeObjectTypeName : TLabel;
  edtENBuilderObjectTypeObjectTypeName : TEdit;
  spbENBuilderObjectTypeObjectType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENBuilderObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENBuilderObjectTypeObjectTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuilderObjectFilterEdit: TfrmENBuilderObjectFilterEdit;
  ENBuilderObjectFilterObj: ENBuilderObjectFilter;

implementation

uses
  ShowENBuilderObjectType
  ,ENBuilderObjectTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENBuilderObjectController  ;
}
{$R *.dfm}



procedure TfrmENBuilderObjectFilterEdit.FormShow(Sender: TObject);

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

    edtInvNumber.Text := ENBuilderObjectObj.invNumber; 



    edtName.Text := ENBuilderObjectObj.name; 



    edtBuhName.Text := ENBuilderObjectObj.buhName; 



    if ( ENBuilderObjectObj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENBuilderObjectObj.yearBuild)
    else
       edtYearBuild.Text := '';



    if ( ENBuilderObjectObj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENBuilderObjectObj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';



    edtCommentGen.Text := ENBuilderObjectObj.commentGen; 



      if ENBuilderObjectObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENBuilderObjectObj.dateGen.Year,ENBuilderObjectObj.dateGen.Month,ENBuilderObjectObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtUserGen.Text := ENBuilderObjectObj.userGen; 


  end;

}

end;



procedure TfrmENBuilderObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBuilderObjectFilterObj.invNumber := edtInvNumber.Text; 



     ENBuilderObjectFilterObj.name := edtName.Text; 



     ENBuilderObjectFilterObj.buhName := edtBuhName.Text; 



     if ( edtYearBuild.Text <> '' ) then
       ENBuilderObjectFilterObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENBuilderObjectFilterObj.yearBuild := Low(Integer) ;




     if ( edtYearWorkingStart.Text <> '' ) then
       ENBuilderObjectFilterObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENBuilderObjectFilterObj.yearWorkingStart := Low(Integer) ;




     ENBuilderObjectFilterObj.commentGen := edtCommentGen.Text; 



     if ENBuilderObjectFilterObj.dateGen = nil then
        ENBuilderObjectFilterObj.dateGen := TXSDate.Create;
      ENBuilderObjectFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     ENBuilderObjectFilterObj.userGen := edtUserGen.Text; 




  end;
end;

procedure TfrmENBuilderObjectFilterEdit.spbENBuilderObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENBuilderObjectTypeShow: TfrmENBuilderObjectTypeShow;
begin
   frmENBuilderObjectTypeShow:=TfrmENBuilderObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENBuilderObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBuilderObjectFilterObj.objectType = nil then ENBuilderObjectFilterObj.objectType := ENBuilderObjectType.Create();
               ENBuilderObjectFilterObj.objectType.code := StrToInt(GetReturnValue(sgENBuilderObjectType,0));
               edtENBuilderObjectTypeObjectTypeName.Text:=GetReturnValue(sgENBuilderObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBuilderObjectTypeShow.Free;
   end;
end;


procedure TfrmENBuilderObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBuilderObjectFilterObj.element = nil then ENBuilderObjectFilterObj.element := ENElement.Create();
               ENBuilderObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.