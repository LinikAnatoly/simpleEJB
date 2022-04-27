unit EditBillImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, Grids, BaseGrid,
  AdvGrid, InvokeRegistry, Rio, SOAPHTTPClient, AdvProgressBar,
  GridHeadersUnit,RQBillItemController, ExtCtrls, AdvObj;

type
  TfrmBillImportEdit = class(TDialogForm)
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cbFileType: TComboBox;
    dtpCalcDate: TDateTimePicker;
    edtFileName: TEdit;
    spbFile: TSpeedButton;
    btnOk: TButton;
    btnCancel: TButton;
    odFile: TOpenDialog;
    sgBillItem: TAdvStringGrid;
    HTTPRIORQBillItem: THTTPRIO;
    Label4: TLabel;
    pnlTotalSum: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spbFileClick(Sender: TObject);
    procedure LoadGrid(Const S: String; Const Grid: TStringGrid);
    procedure ClearGrid(Const Grid : TStringGrid);
    procedure btnOkClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateList;
  end;

var
  frmBillImportEdit: TfrmBillImportEdit;

  RQBillItemHeaders: array [1..16] of String =
        ( 'постачальник'
          ,'ОКПО'
          , 'Матеріал'
          ,'дата заявки'
          ,''
          ,''
          ,'Од. виміру'
          ,'Кількість'
          ,'Ціна (без ПДВ)'
          ,'Сума (без ПДВ)'
          ,'код матеріалу'
          ,''
          ,''
          ,'% ПДВ'
          ,''
          ,''
        );


implementation

uses ChildFormUnit, Registry, XSBuiltIns,
  Main;

{$R *.dfm}

var SubKeys: TStrings;

procedure TfrmBillImportEdit.FormShow(Sender: TObject);
begin
    ClearGrid(sgBillItem);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([cbFileType]);
    DenyBlankValues([edtFileName]);

    UpdateList;
  end;

  if DialogState = dsInsert then Exit;
end;

procedure TfrmBillImportEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var KeyName, parsePlugin, strToLog, strAmountGranted: String;
    ReportFile: TStrings;
    Reg: TRegistry;
    PluginHandle: THandle;
    step, i, j, k, cnt, tmpListCount, errCount, len, errPos: Integer;
    calcDate: TXSDate;
begin
end;




procedure TfrmBillImportEdit.btnOkClick(Sender: TObject);
//procedure TfrmBillImportEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
   TempRQBillItem: RQBillItemControllerSoapPort;
   eList : RQBillItemShortList;
   eArr :  ArrayOfRQBillItemShort;
   eObj :  RQBillItemShort;
   state : boolean;
   i, n : Integer;
   corrCount : TXSDecimal;
begin
 //  try


  eList := RQBillItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, sgBillItem.RowCount - 1);
  n := 0;
  state := true;
  for i := 1 to sgBillItem.RowCount - 1 do
  begin
    if state then
    begin
       eObj := RQBillItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);

 { RQBillItemHeaders: array [1..16] of String =
        ( 'постачальник'   0
          ,'ОКПО'           1
          , 'Матеріал'       2
          ,'дата заявки'      3
          ,''                  4
          ,''                   5
          ,'Од. виміру'          6
          ,'Кількість'            7
          ,'Ціна (без ПДВ)'        8
          ,'Сума (без ПДВ)'         9
          ,'код матеріалу'           10
          ,''                          11
          ,''                            12
          ,'% ПДВ'                         13
          ,''                                14
          ,''                                  15
        );
       }


       eObj.materialNameTxt := sgBillItem.Cells[2, i];
       eObj.measurementNameTxt := sgBillItem.Cells[6, i];
       eObj.countGen := TXSDecimal.Create;
       eObj.countGen.DecimalString := sgBillItem.Cells[7, i];
       eObj.priceWithoutNds := TXSDecimal.Create;
       eObj.priceWithoutNds.DecimalString := sgBillItem.Cells[8, i];
       eObj.sumWithoutNds := TXSDecimal.Create;
       eObj.sumWithoutNds.DecimalString := sgBillItem.Cells[9, i];
       eObj.materialCode := StrToInt(sgBillItem.Cells[10, i]);

       eObj.billRefNumberDoc := sgBillItem.Cells[11, i];
       eObj.finDocId := StrToInt(sgBillItem.Cells[13, i]); // NET-4284 ндс берем с тект файла


       eArr[n] := eObj;
       n := n + 1;
    end;
  end;
  eList.list := eArr;
  if (High(eArr) >= 0) then
   begin
   TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   TempRQBillItem.importBill(eArr);
   end;
  //btnSelectClick(Sender);
end;




procedure TfrmBillImportEdit.UpdateList;
var i, j, count: Integer;
    Reg: TRegistry;
    ScriptName: String;
begin

//  SetGridHeaders(RQBillItemHeaders, sgBillItem.ColumnHeaders);

  for i:=1 to sgBillItem.RowCount-1 do
    for j:=0 to sgBillItem.ColCount-1 do
      sgBillItem.Cells[j,i]:='';

  sgBillItem.RowCount := 2;

  try

    Reg := TRegistry.Create;
    with Reg do
      try
        RootKey := HKEY_CURRENT_USER;
        begin

          //try
            SubKeys.Clear;
            GetKeyNames(SubKeys);
            CloseKey;

            if SubKeys.Count = 0 then
              sgBillItem.RowCount := 2
            else
              sgBillItem.RowCount := SubKeys.Count+1;

            for i:=0 to SubKeys.Count-1 do
            begin
              ScriptName := '';
              begin
                ScriptName := ReadString('ScriptName');
                CloseKey;
              end;
              sgBillItem.Cells[0,i+1] := ScriptName;
            end;

            sgBillItem.Row := 1;

        end;

      finally
        Reg.Free;
      end;

  except
    Application.MessageBox(PChar('Сбой при попытке доступа к реестру Windows'),
                           PChar('Ошибка!'), MB_ICONERROR);
    Exit;
  end;
end;

procedure TfrmBillImportEdit.FormCreate(Sender: TObject);
begin
  SubKeys := TStringList.Create;
end;

procedure TfrmBillImportEdit.FormDestroy(Sender: TObject);
begin
  SubKeys.Free;
end;

procedure TfrmBillImportEdit.spbFileClick(Sender: TObject);
begin
  if odFile.Execute then
    edtFileName.Text := odFile.FileName;
    LoadGrid(odFile.FileName, sgBillItem);
end;


procedure TfrmBillImportEdit.ClearGrid(Const Grid : TStringGrid);
var
  i : Integer;
begin
  for i := Grid.FixedRows to Grid.RowCount - 1 do begin
    Grid.Rows[i].Clear;
  end;
  Grid.RowCount := Grid.FixedRows + 1;
end;



procedure TfrmBillImportEdit.LoadGrid(Const S: String; Const Grid: TStringGrid);
var ff: TextFile;
    St: String;
    totalSum, itemSum: Double;    
begin
 SetGridHeaders(RQBillItemHeaders, sgBillItem.ColumnHeaders);
 AssignFile(ff, S);
 Reset(ff);
 try
  ClearGrid(Grid);
  totalSum := 0;
  while not Eof(ff) Do
   begin
    ReadLn(ff, St);
    with Grid Do
     begin
      FormatSettings.DecimalSeparator := '.';

      //if RowCount >= FixedRows + 1 then
      Rows[RowCount-1].Text:=StringReplace(St, #9, #13#10, [rfReplaceAll]);

      itemSum := StrToFloat(Grid.Cells[9, RowCount-1]);
      totalSum := totalSum + itemSum;

      RowCount:=RowCount + 1;
     end;
   end;

   pnlTotalSum.Caption := SeparateThousands(FloatToStr(Conv(totalSum, 2)));

   if Grid.RowCount > Grid.FixedRows + 1 then
     Grid.RowCount := Grid.RowCount - 1;
 finally
  CloseFile(ff);
 end;
end;




end.
