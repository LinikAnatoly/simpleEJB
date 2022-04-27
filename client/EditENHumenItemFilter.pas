
unit EditENHumenItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHumenItemController ;

type
  TfrmENHumenItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblPrice : TLabel;
    edtPrice: TEdit;
    lblCost : TLabel;
    edtCost: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKPositionPositionGenName : TLabel;
  edtTKPositionPositionGenName : TEdit;
  spbTKPositionPositionGen : TSpeedButton;
  
  lblENManningTableManningTableName : TLabel;
  edtENManningTableManningTableName : TEdit;
  spbENManningTableManningTable : TSpeedButton;
  
  lblENWorkerWorkerFactName : TLabel;
  edtENWorkerWorkerFactName : TEdit;
  spbENWorkerWorkerFact : TSpeedButton;
  

  HTTPRIOENHumenItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKPositionPositionGenClick(Sender : TObject);
  procedure spbENManningTableManningTableClick(Sender : TObject);
  procedure spbENWorkerWorkerFactClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENHumenItemFilterEdit: TfrmENHumenItemFilterEdit;
  ENHumenItemFilterObj: ENHumenItemFilter;

implementation

uses
  ShowTKPosition
  ,TKPositionController
  ,ShowENManningTable
  ,ENManningTableController
  ,ShowENWorker
  ,ENWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENHumenItemController  ;
}
{$R *.dfm}



procedure TfrmENHumenItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENHumenItemObj.countGen <> nil ) then
       edtCountGen.Text := ENHumenItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENHumenItemObj.countFact <> nil ) then
       edtCountFact.Text := ENHumenItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( ENHumenItemObj.price <> nil ) then
       edtPrice.Text := ENHumenItemObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( ENHumenItemObj.cost <> nil ) then
       edtCost.Text := ENHumenItemObj.cost.decimalString
    else
       edtCost.Text := ''; 



    edtCommentGen.Text := ENHumenItemObj.commentGen; 



    edtUserGen.Text := ENHumenItemObj.userGen; 



      if ENHumenItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENHumenItemObj.dateEdit.Year,ENHumenItemObj.dateEdit.Month,ENHumenItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmENHumenItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHumenItem: ENHumenItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENHumenItemFilterObj.countGen = nil ) then
       ENHumenItemFilterObj.countGen := TXSDecimal.Create;
     ENHumenItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     if (ENHumenItemFilterObj.countFact = nil ) then
       ENHumenItemFilterObj.countFact := TXSDecimal.Create;
     ENHumenItemFilterObj.countFact.decimalString := edtCountFact.Text ;



     if (ENHumenItemFilterObj.price = nil ) then
       ENHumenItemFilterObj.price := TXSDecimal.Create;
     ENHumenItemFilterObj.price.decimalString := edtPrice.Text ;



     if (ENHumenItemFilterObj.cost = nil ) then
       ENHumenItemFilterObj.cost := TXSDecimal.Create;
     ENHumenItemFilterObj.cost.decimalString := edtCost.Text ;



     ENHumenItemFilterObj.commentGen := edtCommentGen.Text; 



     ENHumenItemFilterObj.userGen := edtUserGen.Text; 



     if ENHumenItemFilterObj.dateEdit = nil then
        ENHumenItemFilterObj.dateEdit := TXSDate.Create;
      ENHumenItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmENHumenItemFilterEdit.spbTKPositionPositionGenClick(Sender : TObject);
var 
   frmTKPositionShow: TfrmTKPositionShow;
begin
   frmTKPositionShow:=TfrmTKPositionShow.Create(Application,fmNormal);
   try
      with frmTKPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemFilterObj.positionGen = nil then ENHumenItemFilterObj.positionGen := TKPosition.Create();
               ENHumenItemFilterObj.positionGen.code := StrToInt(GetReturnValue(sgTKPosition,0));
               edtTKPositionPositionGenName.Text:=GetReturnValue(sgTKPosition,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKPositionShow.Free;
   end;
end;


procedure TfrmENHumenItemFilterEdit.spbENManningTableManningTableClick(Sender : TObject);
var 
   frmENManningTableShow: TfrmENManningTableShow;
begin
{
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemFilterObj.manningTable = nil then ENHumenItemFilterObj.manningTable := ENManningTable.Create();
               ENHumenItemFilterObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManningTableShow.Free;
   end;
   }
end;


procedure TfrmENHumenItemFilterEdit.spbENWorkerWorkerFactClick(Sender : TObject);
var 
   frmENWorkerShow: TfrmENWorkerShow;
begin
{
   frmENWorkerShow:=TfrmENWorkerShow.Create(Application,fmNormal);
   try
      with frmENWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemFilterObj.workerFact = nil then ENHumenItemFilterObj.workerFact := ENWorker.Create();
               ENHumenItemFilterObj.workerFact.code := StrToInt(GetReturnValue(sgENWorker,0));
               edtENWorkerWorkerFactName.Text:=GetReturnValue(sgENWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkerShow.Free;
   end;
   }
end;





end.