
unit ShowENRecordPointByt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENRecordPointBytController, AdvObj ;


type
    TfrmENRecordPointBytShow = class(TChildForm)  
    HTTPRIOENRecordPointByt: THTTPRIO;
    ImageList1: TImageList;
    sgENRecordPointByt: TAdvStringGrid;
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
    procedure sgENRecordPointBytTopLeftChanged(Sender: TObject);
    procedure sgENRecordPointBytDblClick(Sender: TObject);
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
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList(f: ENRecordPointBytFilter) : ENRecordPointBytShort; stdcall; static;
 end;


var
  frmENRecordPointBytShow: TfrmENRecordPointBytShow;
  
  
implementation

uses Main, EditENRecordPointBytFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRecordPointBytHeaders: array [1..6] of String =
        ( 'Код'
          ,'Особовий рахунок'
          ,'ФИО абонента'
          ,'Адреса ТУ'
          ,'EIC точки учета'
          , 'Підрозділ'
        );
   
class function TfrmENRecordPointBytShow.chooseFromList(f: ENRecordPointBytFilter) : ENRecordPointBytShort;
var
  f1 : ENRecordPointBytFilter;
  frmENRecordPointBytShow : TfrmENRecordPointBytShow;
  selected : ENRecordPointBytShort;
begin
  inherited;
     selected := nil;
     if not Assigned(f) then begin
      f1 := ENRecordPointBytFilter.Create;
      SetNullXSProps(f1);
      SetNullIntProps(f1);
     end else begin
      f1 := f;
     end;
     frmENRecordPointBytShow := TfrmENRecordPointBytShow.Create(Application, fmNormal, f1);
       try
          with frmENRecordPointBytShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENRecordPointBytShort(sgENRecordPointByt.Objects[0, sgENRecordPointByt.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENRecordPointBytShow.Free;
       end;
end;

procedure TfrmENRecordPointBytShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENRecordPointBytShow:=nil;
  inherited;
end;


procedure TfrmENRecordPointBytShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENRecordPointBytShow.FormShow(Sender: TObject);
var
  TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
  i: Integer;
  ENRecordPointBytList: ENRecordPointBytShortList;
begin
  SetGridHeaders(ENRecordPointBytHeaders, sgENRecordPointByt.ColumnHeaders);
  ColCount:=100;
  TempENRecordPointByt :=  HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRecordPointBytFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRecordPointBytList := TempENRecordPointByt.getScrollableFilteredList(ENRecordPointBytFilter(FilterObject),0,ColCount);
  LastCount:=High(ENRecordPointBytList.list);

  if LastCount > -1 then
     sgENRecordPointByt.RowCount:=LastCount+2
  else
     sgENRecordPointByt.RowCount:=2;

   with sgENRecordPointByt do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRecordPointBytList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENRecordPointBytList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENRecordPointBytList.list[i].accountNumber;
        Cells[2,i+1] := ENRecordPointBytList.list[i].name;
        Cells[3,i+1] := ENRecordPointBytList.list[i].address;
        Cells[4,i+1] := ENRecordPointBytList.list[i].codeEIC;
        Cells[5,i+1] := ENRecordPointBytList.list[i].renName;
        Objects[0, i+1] := ENRecordPointBytList.list[i];
        LastRow:=i+1;
        sgENRecordPointByt.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENRecordPointByt.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENRecordPointByt.RowCount > selectedRow then
      sgENRecordPointByt.Row := selectedRow
    else
      sgENRecordPointByt.Row := sgENRecordPointByt.RowCount - 1;
    end
    else
      sgENRecordPointByt.Row:=1;   
end;


procedure TfrmENRecordPointBytShow.sgENRecordPointBytTopLeftChanged(Sender: TObject);
var
  TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
  i,CurrentRow: Integer;
  ENRecordPointBytList: ENRecordPointBytShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRecordPointByt.TopRow + sgENRecordPointByt.VisibleRowCount) = ColCount
  then
    begin
      TempENRecordPointByt :=  HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
      CurrentRow:=sgENRecordPointByt.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRecordPointBytFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRecordPointBytList := TempENRecordPointByt.getScrollableFilteredList(ENRecordPointBytFilter(FilterObject),ColCount-1, 100);


  sgENRecordPointByt.RowCount:=sgENRecordPointByt.RowCount+100;
  LastCount:=High(ENRecordPointBytList.list);
  with sgENRecordPointByt do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRecordPointBytList.list[i].code <> Low(Integer) then
          Cells[0,i + CurrentRow] := IntToStr(ENRecordPointBytList.list[i].code)
        else
          Cells[0,i + CurrentRow] := '';
        Cells[1,i + CurrentRow] := ENRecordPointBytList.list[i].accountNumber;
        Cells[2,i + CurrentRow] := ENRecordPointBytList.list[i].name;
        Cells[3,i + CurrentRow] := ENRecordPointBytList.list[i].address;
        Cells[4,i + CurrentRow] := ENRecordPointBytList.list[i].codeEIC;
        Cells[5,i + CurrentRow] := ENRecordPointBytList.list[i].renName;
        Objects[0, i + CurrentRow] := ENRecordPointBytList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRecordPointByt.Row:=CurrentRow-5;
   sgENRecordPointByt.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRecordPointBytShow.sgENRecordPointBytDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRecordPointByt,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENRecordPointBytShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENRecordPointByt.RowCount-1 do
   for j:=0 to sgENRecordPointByt.ColCount-1 do
     sgENRecordPointByt.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENRecordPointBytShow.actViewExecute(Sender: TObject);
{var
  TempENRecordPointByt: ENRecordPointBytControllerSoapPort;}
begin
{  TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
  try
    ENRecordPointBytObj := TempENRecordPointByt.getObject(StrToInt(sgENRecordPointByt.Cells[0, sgENRecordPointByt.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENRecordPointBytEdit := TfrmENRecordPointBytEdit.Create(Application, dsView);
  try
    frmENRecordPointBytEdit.ShowModal;
  finally
    frmENRecordPointBytEdit.Free;
    frmENRecordPointBytEdit := nil;
  end; }
end;


procedure TfrmENRecordPointBytShow.actEditExecute(Sender: TObject);
{var
  TempENRecordPointByt: ENRecordPointBytControllerSoapPort; }
begin
 {empENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
  try
    ENRecordPointBytObj := TempENRecordPointByt.getObject(StrToInt(sgENRecordPointByt.Cells[0,sgENRecordPointByt.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRecordPointByt.Row;
  frmENRecordPointBytEdit:=TfrmENRecordPointBytEdit.Create(Application, dsEdit);
  
  try
    if frmENRecordPointBytEdit.ShowModal= mrOk then
      begin
        //TempENRecordPointByt.save(ENRecordPointBytObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRecordPointBytEdit.Free;
    frmENRecordPointBytEdit:=nil;
  end;

  if sgENRecordPointByt.RowCount > selectedRow then
    sgENRecordPointByt.Row := selectedRow
  else
    sgENRecordPointByt.Row := sgENRecordPointByt.RowCount - 1;
  }
end;


procedure TfrmENRecordPointBytShow.actDeleteExecute(Sender: TObject);
{Var TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
  ObjCode: Integer;}
begin
 {TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRecordPointByt.Cells[0,sgENRecordPointByt.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (ТУ быта )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRecordPointByt.remove(ObjCode);
      UpdateGrid(Sender);
  end;}
end;

procedure TfrmENRecordPointBytShow.actInsertExecute(Sender: TObject);
// Var TempENRecordPointByt: ENRecordPointBytControllerSoapPort; 
begin
  // TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;  /// Это здесь уже лишнее!!!
  //ENRecordPointBytObj:=ENRecordPointByt.Create;
  //SetNullIntProps(ENRecordPointBytObj);
  //SetNullXSProps(ENRecordPointBytObj);

   //ENRecordPointBytObj.contractDate:= TXSDate.Create;
   //ENRecordPointBytObj.dateCounterInst:= TXSDate.Create;
   //ENRecordPointBytObj.dateCounterCheck:= TXSDate.Create;
   //ENRecordPointBytObj.classAccuracy:= TXSDecimal.Create;
   //ENRecordPointBytObj.checkperiod:= TXSDecimal.Create;
   //ENRecordPointBytObj.phasity:= TXSDecimal.Create;
   //ENRecordPointBytObj.datecheck:= TXSDate.Create;
   //ENRecordPointBytObj.checkperiod1:= TXSDecimal.Create;
   //ENRecordPointBytObj.counterVoltageNominal:= TXSDecimal.Create;
   //ENRecordPointBytObj.counterDateProduct:= TXSDate.Create;
   //ENRecordPointBytObj.dateFirstConsumption:= TXSDate.Create;
   //ENRecordPointBytObj.prevCheckPeriod:= TXSDate.Create;


 { try
    frmENRecordPointBytEdit:=TfrmENRecordPointBytEdit.Create(Application, dsInsert);
    try
      if frmENRecordPointBytEdit.ShowModal = mrOk then
      begin
        if ENRecordPointBytObj<>nil then
            //TempENRecordPointByt.add(ENRecordPointBytObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRecordPointBytEdit.Free;
      frmENRecordPointBytEdit:=nil;
    end;
  finally
    ENRecordPointBytObj.Free;
  end; }
end;


procedure TfrmENRecordPointBytShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENRecordPointBytShow.actFilterExecute(Sender: TObject);
begin
frmENRecordPointBytFilterEdit:=TfrmENRecordPointBytFilterEdit.Create(Application, dsInsert);
  try
    ENRecordPointBytFilterObj := ENRecordPointBytFilter.Create;
    SetNullIntProps(ENRecordPointBytFilterObj);
    SetNullXSProps(ENRecordPointBytFilterObj);

    if frmENRecordPointBytFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENRecordPointBytFilter.Create;
      FilterObject := ENRecordPointBytFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRecordPointBytFilterEdit.Free;
    frmENRecordPointBytFilterEdit:=nil;
  end;
end;


procedure TfrmENRecordPointBytShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.