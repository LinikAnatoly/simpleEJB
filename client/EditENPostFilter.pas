
unit EditENPostFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPostController ;

type
  TfrmENPostFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblPostNumberGen : TLabel;
    edtPostNumberGen: TEdit;

    lblYearSetup : TLabel;
    edtYearSetup: TEdit;

    lblWoodenLength : TLabel;
    edtWoodenLength: TEdit;

    lblLastRepairDate : TLabel;
    edtLastRepairDate: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENPostTypePostTtypeName : TLabel;
  edtENPostTypePostTtypeName : TEdit;
  spbENPostTypePostTtype : TSpeedButton;
  
  lblENGroundTypeGroundName : TLabel;
  edtENGroundTypeGroundName : TEdit;
  spbENGroundTypeGround : TSpeedButton;
  

  HTTPRIOENPost: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENPostTypePostTtypeClick(Sender : TObject);
  procedure spbENGroundTypeGroundClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPostFilterEdit: TfrmENPostFilterEdit;
  ENPostFilterObj: ENPostFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENPostType
  ,ENPostTypeController
  ,ShowENGroundType
  ,ENGroundTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPostController  ;
}
{$R *.dfm}



procedure TfrmENPostFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtPostNumberGen
      ,edtYearSetup
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENPostObj.name; 



    edtPostNumberGen.Text := ENPostObj.postNumberGen; 



    if ( ENPostObj.yearSetup <> Low(Integer) ) then
       edtYearSetup.Text := IntToStr(ENPostObj.yearSetup)
    else
       edtYearSetup.Text := '';



    if ( ENPostObj.woodenLength <> nil ) then
       edtWoodenLength.Text := ENPostObj.woodenLength.decimalString
    else
       edtWoodenLength.Text := ''; 



      if ENPostObj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime:=EncodeDate(ENPostObj.lastRepairDate.Year,ENPostObj.lastRepairDate.Month,ENPostObj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;


  end;

}

end;



procedure TfrmENPostFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENPost: ENPostControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPostFilterObj.name := edtName.Text; 



     ENPostFilterObj.postNumberGen := edtPostNumberGen.Text; 



     if ( edtYearSetup.Text <> '' ) then
       ENPostFilterObj.yearSetup := StrToInt(edtYearSetup.Text)
     else
       ENPostFilterObj.yearSetup := Low(Integer) ;




     if (ENPostFilterObj.woodenLength = nil ) then
       ENPostFilterObj.woodenLength := TXSDecimal.Create;
     if edtWoodenLength.Text <> '' then
       ENPostFilterObj.woodenLength.decimalString := edtWoodenLength.Text 
     else
       ENPostFilterObj.woodenLength := nil;




     if edtlastRepairDate.checked then
     begin 
       if ENPostFilterObj.lastRepairDate = nil then
          ENPostFilterObj.lastRepairDate := TXSDate.Create;
       ENPostFilterObj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));
     end
     else
       ENPostFilterObj.lastRepairDate := nil;




  end;
end;

procedure TfrmENPostFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPostFilterObj.element = nil then ENPostFilterObj.element := ENElement.Create();
               ENPostFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENPostFilterEdit.spbENPostTypePostTtypeClick(Sender : TObject);
var 
   frmENPostTypeShow: TfrmENPostTypeShow;
begin
   frmENPostTypeShow:=TfrmENPostTypeShow.Create(Application,fmNormal);
   try
      with frmENPostTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPostFilterObj.postTtype = nil then ENPostFilterObj.postTtype := ENPostType.Create();
               ENPostFilterObj.postTtype.code := StrToInt(GetReturnValue(sgENPostType,0));
               edtENPostTypePostTtypeName.Text:=GetReturnValue(sgENPostType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostTypeShow.Free;
   end;
end;


procedure TfrmENPostFilterEdit.spbENGroundTypeGroundClick(Sender : TObject);
var 
   frmENGroundTypeShow: TfrmENGroundTypeShow;
begin
   frmENGroundTypeShow:=TfrmENGroundTypeShow.Create(Application,fmNormal);
   try
      with frmENGroundTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPostFilterObj.ground = nil then ENPostFilterObj.ground := ENGroundType.Create();
               ENPostFilterObj.ground.code := StrToInt(GetReturnValue(sgENGroundType,0));
               edtENGroundTypeGroundName.Text:=GetReturnValue(sgENGroundType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENGroundTypeShow.Free;
   end;
end;





end.