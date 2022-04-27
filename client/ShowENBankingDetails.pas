
unit ShowENBankingDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBankingDetailsController, AdvObj ;


type
    TfrmENBankingDetailsShow = class(TChildForm)  
    HTTPRIOENBankingDetails: THTTPRIO;
    ImageList1: TImageList;
    sgENBankingDetails: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENBankingDetailsTopLeftChanged(Sender: TObject);
    procedure sgENBankingDetailsDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENBankingDetailsObj: ENBankingDetails;
 // ENBankingDetailsFilterObj: ENBankingDetailsFilter;
  
  
implementation

uses Main, EditENBankingDetails, EditENBankingDetailsFilter;


{$R *.dfm}

var
  //frmENBankingDetailsShow : TfrmENBankingDetailsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBankingDetailsHeaders: array [1..8] of String =
        ( 'Код'
          ,'наименование банка'
          ,'окпо банка'
          ,'МФО банка'
          ,'Расчетный счет в банке'
          ,'код банка справочные данные'
          ,'код договора с банком'
          ,'Признак использования счета по умолчанию'
        );
   

procedure TfrmENBankingDetailsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBankingDetailsShow:=nil;
  inherited;
end;


procedure TfrmENBankingDetailsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBankingDetailsShow.FormShow(Sender: TObject);
var
  TempENBankingDetails: ENBankingDetailsControllerSoapPort;
  i: Integer;
  ENBankingDetailsList: ENBankingDetailsShortList;
begin
  SetGridHeaders(ENBankingDetailsHeaders, sgENBankingDetails.ColumnHeaders);
  ColCount:=100;
  TempENBankingDetails :=  HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBankingDetailsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBankingDetailsList := TempENBankingDetails.getScrollableFilteredList(ENBankingDetailsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBankingDetailsList.list);

  if LastCount > -1 then
     sgENBankingDetails.RowCount:=LastCount+2
  else
     sgENBankingDetails.RowCount:=2;

   with sgENBankingDetails do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBankingDetailsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBankingDetailsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBankingDetailsList.list[i].bankname;
        Cells[2,i+1] := ENBankingDetailsList.list[i].bankokpo;
        if ENBankingDetailsList.list[i].bankmfo = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENBankingDetailsList.list[i].bankmfo);
        Cells[4,i+1] := ENBankingDetailsList.list[i].bankaccount;
        Cells[5,i+1] := ENBankingDetailsList.list[i].partnercode;
        Cells[6,i+1] := ENBankingDetailsList.list[i].contract;
        if ENBankingDetailsList.list[i].useDefault = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENBankingDetailsList.list[i].useDefault);
        LastRow:=i+1;
        sgENBankingDetails.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBankingDetails.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBankingDetails.RowCount > selectedRow then
      sgENBankingDetails.Row := selectedRow
    else
      sgENBankingDetails.Row := sgENBankingDetails.RowCount - 1;
    end
    else
      sgENBankingDetails.Row:=1;   
end;


procedure TfrmENBankingDetailsShow.sgENBankingDetailsTopLeftChanged(Sender: TObject);
var
  TempENBankingDetails: ENBankingDetailsControllerSoapPort;
  i,CurrentRow: Integer;
  ENBankingDetailsList: ENBankingDetailsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBankingDetails.TopRow + sgENBankingDetails.VisibleRowCount) = ColCount
  then
    begin
      TempENBankingDetails :=  HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;
      CurrentRow:=sgENBankingDetails.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBankingDetailsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBankingDetailsList := TempENBankingDetails.getScrollableFilteredList(ENBankingDetailsFilter(FilterObject),ColCount-1, 100);


  sgENBankingDetails.RowCount:=sgENBankingDetails.RowCount+100;
  LastCount:=High(ENBankingDetailsList.list);
  with sgENBankingDetails do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBankingDetailsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBankingDetailsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBankingDetailsList.list[i].bankname;
        Cells[2,i+CurrentRow] := ENBankingDetailsList.list[i].bankokpo;
        if ENBankingDetailsList.list[i].bankmfo = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENBankingDetailsList.list[i].bankmfo);
        Cells[4,i+CurrentRow] := ENBankingDetailsList.list[i].bankaccount;
        Cells[5,i+CurrentRow] := ENBankingDetailsList.list[i].partnercode;
        Cells[6,i+CurrentRow] := ENBankingDetailsList.list[i].contract;
        if ENBankingDetailsList.list[i].useDefault = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENBankingDetailsList.list[i].useDefault);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBankingDetails.Row:=CurrentRow-5;
   sgENBankingDetails.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBankingDetailsShow.sgENBankingDetailsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBankingDetails,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBankingDetailsShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBankingDetails.RowCount-1 do
   for j:=0 to sgENBankingDetails.ColCount-1 do
     sgENBankingDetails.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBankingDetailsShow.actViewExecute(Sender: TObject);
var 
  TempENBankingDetails: ENBankingDetailsControllerSoapPort;
begin
  TempENBankingDetails := HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;
  try
    ENBankingDetailsObj := TempENBankingDetails.getObject(StrToInt(sgENBankingDetails.Cells[0,sgENBankingDetails.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBankingDetails.Row;
  frmENBankingDetailsEdit:=TfrmENBankingDetailsEdit.Create(Application, dsView);
  
  try
    frmENBankingDetailsEdit.ShowModal;
  finally
    frmENBankingDetailsEdit.Free;
    frmENBankingDetailsEdit:=nil;
  end;

  if sgENBankingDetails.RowCount > selectedRow then
    sgENBankingDetails.Row := selectedRow
  else
    sgENBankingDetails.Row := sgENBankingDetails.RowCount - 1;
  
end;


procedure TfrmENBankingDetailsShow.actEditExecute(Sender: TObject);
var 
  TempENBankingDetails: ENBankingDetailsControllerSoapPort;
begin
  TempENBankingDetails := HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;
  try
    ENBankingDetailsObj := TempENBankingDetails.getObject(StrToInt(sgENBankingDetails.Cells[0,sgENBankingDetails.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBankingDetails.Row;
  frmENBankingDetailsEdit:=TfrmENBankingDetailsEdit.Create(Application, dsEdit);
  
  try
    if frmENBankingDetailsEdit.ShowModal= mrOk then
      begin
        //TempENBankingDetails.save(ENBankingDetailsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBankingDetailsEdit.Free;
    frmENBankingDetailsEdit:=nil;
  end;

  if sgENBankingDetails.RowCount > selectedRow then
    sgENBankingDetails.Row := selectedRow
  else
    sgENBankingDetails.Row := sgENBankingDetails.RowCount - 1;
  
end;


procedure TfrmENBankingDetailsShow.actDeleteExecute(Sender: TObject);
Var TempENBankingDetails: ENBankingDetailsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBankingDetails := HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBankingDetails.Cells[0,sgENBankingDetails.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник банковских реквизитов исполнителя ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBankingDetails.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBankingDetailsShow.actInsertExecute(Sender: TObject);
// Var TempENBankingDetails: ENBankingDetailsControllerSoapPort; 
begin
  // TempENBankingDetails := HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBankingDetailsObj:=ENBankingDetails.Create;
  SetNullIntProps(ENBankingDetailsObj);
  SetNullXSProps(ENBankingDetailsObj);



  try
    frmENBankingDetailsEdit:=TfrmENBankingDetailsEdit.Create(Application, dsInsert);
    try
      if frmENBankingDetailsEdit.ShowModal = mrOk then
      begin
        if ENBankingDetailsObj<>nil then
            //TempENBankingDetails.add(ENBankingDetailsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBankingDetailsEdit.Free;
      frmENBankingDetailsEdit:=nil;
    end;
  finally
    ENBankingDetailsObj.Free;
  end;
end;


procedure TfrmENBankingDetailsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBankingDetailsShow.actFilterExecute(Sender: TObject);
begin
{frmENBankingDetailsFilterEdit:=TfrmENBankingDetailsFilterEdit.Create(Application, dsInsert);
  try
    ENBankingDetailsFilterObj := ENBankingDetailsFilter.Create;
    SetNullIntProps(ENBankingDetailsFilterObj);
    SetNullXSProps(ENBankingDetailsFilterObj);

    if frmENBankingDetailsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBankingDetailsFilter.Create;
      FilterObject := ENBankingDetailsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBankingDetailsFilterEdit.Free;
    frmENBankingDetailsFilterEdit:=nil;
  end;}
end;


procedure TfrmENBankingDetailsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.